set terminal latex
set output 'medri-gnuplottex-fig1.tex'
plot [0:2*pi] sin(x) title 'Sine', cos(x) title 'Cosine' \end {gnuplot} \end {beamer@frameslide}\ifbeamer@twoscreenstext \beamer@dosecondscreennow {\frametitle {Empirical Study} \framesubtitle {Trade offs} \begin {gnuplot}[terminal=latex] plot [0:2*pi] sin(x) title 'Sine', cos(x) title 'Cosine' \end {gnuplot} }\fi \ifbeamer@anotherslide \advance \beamer@slideinframe by 1\relax \relax \expandafter \iterate \fi \let \iterate \relax \beamer@writeslidentry \beamer@reseteecodes 




\begin{frame}
\frametitle{Resultados}
\framesubtitle{Comparación}
\begin{itemize}
\item Matrices de confusión \\
\smallskip
\small
\begin{tabular}{ l | l |  l }
   & Actual Match & Actual Unmatch \\ \hline
Det says Matched & $6212$ (tp) & $0$ (fp)\\ \hline
Det says Unmatched & $40862$ (fn) & $4775173$ (tn)\\
  \hline
Prob says Matched & 39628 (tp) & $197$ (fp)\\ \hline
Prob says Unmatched & 7446 (fn) & $4774976$ (tn)\\
  \hline
\end{tabular}
\smallskip
\item Metricas \\
\smallskip
\begin{tabular}{ l | l | l |  l }
   & Precision & Recall & F-Score\\ \hline
Det & $1$  & $0.22$ & $0.36$ \\ \hline
Prob & $0.99$ & $0.84$ & $0.91$ \\   \hline
\end{tabular}
\end{itemize}
\end{frame}


\begin{frame}
\frametitle{Resultados}
\framesubtitle{Conclusión}
\begin{block}{Conclusión}
\begin{itemize}
\item A costa de menos del $1\%$ de precision, Prob, detecta 4 veces mas Matches correctos que Det.
\item Prob puede ser mejorado en varios aspectos incrementando tanto la precision, como la capacidad de detectar matches correctos, mientras que no es claro de que forma se puede mejorar el recall de Det.
\end{itemize}
  \end{block}
\end{frame}



\section{Análisis}

\begin{frame}
\frametitle{Similitud}
\framesubtitle{Un enfoque intuitivo}
\begin{block}{Idea general}
Fichas similares, representan al mismo hotel, fichas disímiles representan hoteles diferentes.
  \end{block}
\begin{itemize}
  \item Definiciones:
  \begin{itemize}
    \item
$\mathbb{F}: \text{conjunto de todas las fichas de hoteles}$ \\
\item
      $\mathbb{D}: \{Match, Unmatch, Review\}$ (conjunto de decisiones posibles)\\
      \item
      $L:(a \in \mathbb{F}, b \in \mathbb{F}) \rightarrow  \mathbb{D}$ (función decisión)
    \end{itemize}
\item Se construye una función de similitud entre fichas de hoteles:
      $S:(a \in \mathbb{F}, b \in \mathbb{F}) \rightarrow  \mathbb{R}$ \\
\item $S$ es una función escalar, cuando mayor es el valor de la función, mas similares son sus argumentos.
\item Se determinan umbrales $m, u \in \mathbb{R}, m\geq u$ de similitud:
\small
$$
L(a,b) =
\begin{cases}
Match & \text{si }S(a,b)>m \\
Review & \text{si }u\leq S(a,b)\leq m \\
Unmatch & \text{si }S(a,b)<u
\end{cases}
$$
\end{itemize}
\end{frame}

\begin{frame}
\frametitle{Similitud}
\framesubtitle{Limitaciones}
\begin{itemize}
\item La similitud entre fichas no necesariamente es un buen indicador de matching: dos fichas pueden ser muy similares y representar hoteles diferentes.
\item Imperfecciones en la función de similitud: para dos fichas $a$ y $b$ muy similares $S(a, b)$ es pequeño.
\item La función de similitud es naturalmente vectorial. Convertirla en escalar inevitablemente introduce ruido.
\end{itemize}
\end{frame}

\begin{frame}
\frametitle{Fellegi y Sunter}
\framesubtitle{Un modelo probabilístico}
\small
\begin{block}{Idea general}
      Se estudia la distribución de la similitud en Matches y Unmatches.
\begin{itemize}
      \item Valores de similitud con frecuencia alta en Matches, pero baja en Unmatches: Match.
      \item Valores de similitud con frecuencia alta en Unmatches, pero baja en Matches: Unmatch.
      \item Valores de similitud con la misma frecuencia en  Matches y Unmatches: Review.
    \end{itemize}
\end{block}
  Definiciones:
  \begin{itemize}
      \item
      $\mathbb{P}: \mathbb{F}\times \mathbb{F}$ producto cartesiando de $\mathbb{F}$
      \item
      $\mathbb{M}: \{(a,b) \in P  \mid a\text{ representa el mismo hotel que }b\}$
      \item
      $\mathbb{U}: \{(a,b) \in P  \mid a\text{ no representa el mismo hotel que }b\}$
      \item
      $\mathbb{P} = \mathbb{U} \cup \mathbb{M}, \mathbb{U} \cap \mathbb{M} = \emptyset$
    \end{itemize}
\end{frame}

\begin{frame}
\frametitle{Fellegi y Sunter}
\framesubtitle{Un modelo probabilístico: Similitud}
  \begin{itemize}
      \item La función similitud es vectorial:
      $\gamma:(a \in \mathbb{F}, b \in \mathbb{F}) \rightarrow  \mathbb{X}^{n}$ \\
      \item Cada componente de la función $\gamma$ es una función de comparación sobre un campo de la ficha (nombre del hotel, dirección, etc.)
      \item Estas componentes no son necesariamente escalares:
      $\gamma(a, b) = <\gamma_1(a, b), \gamma_2(a, b), ..., \gamma_n(a, b)>$
      \item Para cada valor posible de la función $\gamma$, se definen los siguientes parámetros:
      $m(\gamma) = P(\gamma(a, b)=\gamma | \text{ a representa el mismo hotel que b })$
      $u(\gamma) = P(\gamma(a, b)=\gamma | \text{ a no representa el mismo hotel que b })$
      \item $m(\gamma_0)$ nos dice que tanto podemos sospechar de un Match al observar $\gamma_0$
      \item $u(\gamma_0)$ nos dice que tanto podemos sospechar de un Unmatch al observar $\gamma_0$
      \end{itemize}
\end{frame}

\begin{frame}
\frametitle{Fellegi y Sunter}
\framesubtitle{Un modelo probabilístico: Regla de decisión}
  \begin{itemize}
      \item Los parámetros $m$ y $u$ se combinan en un único peso:
      $w(\gamma_0) = m(\gamma_0)/u(\gamma_0)$
      \item A mayor $w$ mayor certeza de estar frente a un Match.
      \item Se determinan umbrales de peso $w_m$, $w_u$, para tomar las decisiones:
      $$
L(a,b) =
\begin{cases}
Match & \text{si }w(\gamma(a,b))>w_m \\
Review & \text{si }w_u\leq w(\gamma(a,b))\leq w_m \\
Unmatch & \text{si }w(\gamma(a,b))<w_u
\end{cases}
$$
\item Esta regla de decisión minimiza la región de revisión humana.
\item La estimación de parámetros $m$ y $u$ se realizó mediante Maximum Likelihood Estimation.
\item Los umbrales fueron determinados por cross validation.
    \end{itemize}
\end{frame}

\begin{frame}
\frametitle{Fellegi y Sunter}
\framesubtitle{Mejoras}
  \begin{itemize}
      \item La regla de decisión es muy robusta a imperfecciones en la función de similitud
      \item A mejor función de similitud mejor rendimiento
      \item Los pesos $w=m/u$ pueden calcularse de otra manera (minimizar el error)
      \item Los parámetros $u$ y $m$ pueden estimarse son métodos no supervisados
      \item La regla de decisión puede ser muy diferente (clasificación lineal general)
          \end{itemize}
\end{frame}

\begin{frame}
\frametitle{Fellegi y Sunter}
\framesubtitle{Ilustración}
\begin{center}
\end{center}
\end{frame}

\begin{frame}
\frametitle{Evaluation set}
Datos históricos: pares matcheados, pares unmatcheados

  \begin{itemize}
\item Problemas
  \begin{itemize}
    \item Volumen insuficiente
  \item Sesgados: solo pares con determinadas (pero desconocidas) características de similitud
  \item Mucho ruido (falsos matches, falsos unmatches)
  \item Proporción de matches y unmatches no realista
\end{itemize}
\item Soluciones


  \begin{itemize}
  \item Reduccion de ruido: ejecuciones iniciales del modelo probabilístico determinaron candidatos a revisión humana que fueron corregidos
  \item Incremento de volumen, reducción de sesgo: clausura bajo transitividad de matches
  \item Incremento de volumen, reducción de sesgo, corrección de proporción entre clases: complemento a producto cartesiano.
  \item El complemento a producto cartesiano produce ruido sistemático por generar falsos unmathces
  \item Reduccion de ruido sistemático: Fellegi Sunter sobre clases de equivalencia.
 \end{itemize}

\end{itemize}


\end{frame}


\begin{frame}%[allowframebreaks]
  \frametitle{Referencias}
  \begin{thebibliography}{10}
  \beamertemplatearticlebibitems
  \bibitem{Fellegi&Sunter1969}
    Ivan P. Fellegi y Alan B. Sunter
    \newblock {\em A Theory for Record Linkage}.
    \newblock {\small Journal of the American Statistical Association Volume 64, Issue 328, 1969.}
  \beamertemplatearticlebibitems
  \bibitem{Deerwester1990}
    S.~Deerwester, et al.
    \newblock {\em Indexing by latent semantic analysis.}
    \newblock {\small JASIS 41.6 (1990): 391-407.}
  \beamertemplatearticlebibitems
  \bibitem{Kanerva2000}
    P.~Kanerva, et al.
    \newblock {\em Random indexing of text samples for latent semantic analysis.}
    \newblock {\small Proceedings of the 22nd annual conference of the cognitive science society. Vol. 1036. 2000.}
  \beamertemplatearticlebibitems
  \bibitem{Achlioptas2003}
    D.~Achlioptas.
    \newblock {\em Database-friendly random projections: Johnson-Lindenstrauss with binary coins.}
    \newblock {\small Journal of computer and System Sciences 66.4 (2003): 671-687.}
  \end{thebibliography}
\end{frame}

\end{document}
