Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A52237A4B8;
	Tue, 11 Aug 2026 18:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786472353; cv=none; b=NLIysolIeBw17RA9K8kMHFORcPzcRw+JUJR0JcpvPHE0VvHFvoVD8GJYiYgeFGQdn+yenS7JRrggGdBEL8qWvU9a6FiB+bCw3UEZzjiCraF12tTeM9IuINdSC82QeI0aChqpHAro3ZPtgs+6yH20+hWAXgyemFRsyIYj8KOrqKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786472353; c=relaxed/simple;
	bh=LSm5DIx4snk6M3aNoS32ZmRfoHK8v9JA9Kz/Uue2v18=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cu7yYuHH+U3hS5ncpIFQLZq5YxDtG8pVwoluXSJxJAUlxHR0CdoZ+8Z3vdI6YPokdXlN5gNILv/R8MKxUo3Gu6Ei9NrN0Fzd0uh5TRDj/8EhDUGbkPv22dbTpgeRKcr3P7+/lisAgxlDBZyEzDFQ3rf3tO6zPOVWGncHKEJpHNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DaDWtMcY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DaDWtMcY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EC751F00A3A;
	Tue, 11 Aug 2026 18:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786472351;
	bh=hc/QLCRd9UCk3o9qsDvUtgMEwoVwkuIh+1I01iMCrYk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DaDWtMcY8ufHf2RmCcMQ9Z+I9s9CjsDj2d7xt6m2i2DtpVyMWgdK1wZE9Alai519n
	 hk7h7tWs0y2xEj4JM7XTtxF/Fwh6Rl++qCQQ/XdoPuktLFdEKESYdthArIuFL9zBuZ
	 UJszx8Ngrn1h8rwBYl98SuqEftkLJNInfeOqEPpwy4fIaWf0UxgnIptwgo/klFL7cn
	 Fh5eL7xwt9PZMvuR0lcFlF/a5nNmaJL4tkRyoAQxmJDGa+HnHha8PdG981IiNdwWaj
	 uTThjlRgToT7TFhZqcZv+ItdRcMDBCgNvdDYMR2JocyxBoD+Jap4qFH3+Ts+6R5do4
	 Qnig35Hn3QOIA==
Date: Tue, 11 Aug 2026 19:19:04 +0100
From: Mark Brown <broonie@kernel.org>
To: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
	Srinivas Kandagatla <srini@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH v1 1/5] dt-bindings: sound: qcom,q6dsp-lpass-ports:
 Rename QAIF clock IDs
Message-ID: <81474771-c89e-4476-97ae-032756879605@sirena.org.uk>
References: <20260808181948.2489187-1-prasad.kumpatla@oss.qualcomm.com>
 <20260808181948.2489187-2-prasad.kumpatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uWz5LYfO0GfAdVdb"
Content-Disposition: inline
In-Reply-To: <20260808181948.2489187-2-prasad.kumpatla@oss.qualcomm.com>
X-Cookie: PARDON me, am I speaking ENGLISH?


--uWz5LYfO0GfAdVdb
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 08, 2026 at 11:49:44PM +0530, Prasad Kumpatla wrote:
> The QAIF clock IDs were added with a LAPSS prefix typo. These IDs are
> new, so rename them directly to the existing LPASS naming convention
> instead of keeping misspelled aliases.

This breaks the build.  *Please* test things before sending them.

/build/stage/linux/sound/soc/qcom/qdsp6/q6prm-clocks.c:67:19: error: =E2=80=
=98LAPSS_CLK_ID_QAIF_IF0_IBIT=E2=80=99 undeclared here (not in a function);=
 did you mean =E2=80=98LPASS_CLK_ID_QAIF_IF0_IBIT=E2=80=99?
   67 |         Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF0_IBIT),
      |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
/build/stage/linux/sound/soc/qcom/qdsp6/q6prm-clocks.c:15:27: note: in defi=
nition of macro =E2=80=98Q6PRM_CLK=E2=80=99
   15 |                 .clk_id =3D id,                           \
      |                           ^~
/build/stage/linux/sound/soc/qcom/qdsp6/q6prm-clocks.c:68:19: error: =E2=80=
=98LAPSS_CLK_ID_QAIF_IF0_EBIT=E2=80=99 undeclared here (not in a function);=
 did you mean =E2=80=98LPASS_CLK_ID_QAIF_IF0_EBIT=E2=80=99?
   68 |         Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF0_EBIT),
      |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
/build/stage/linux/sound/soc/qcom/qdsp6/q6prm-clocks.c:15:27: note: in defi=
nition of macro =E2=80=98Q6PRM_CLK=E2=80=99
   15 |                 .clk_id =3D id,                           \
      |                           ^~
/build/stage/linux/sound/soc/qcom/qdsp6/q6prm-clocks.c:69:19: error: =E2=80=
=98LAPSS_CLK_ID_QAIF_IF1_IBIT=E2=80=99 undeclared here (not in a function);=
 did you mean =E2=80=98LPASS_CLK_ID_QAIF_IF1_IBIT=E2=80=99?
   69 |         Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF1_IBIT),
      |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
/build/stage/linux/sound/soc/qcom/qdsp6/q6prm-clocks.c:15:27: note: in defi=
nition of macro =E2=80=98Q6PRM_CLK=E2=80=99
   15 |                 .clk_id =3D id,                           \
      |                           ^~
/build/stage/linux/sound/soc/qcom/qdsp6/q6prm-clocks.c:70:19: error: =E2=80=
=98LAPSS_CLK_ID_QAIF_IF1_EBIT=E2=80=99 undeclared here (not in a function);=
 did you mean =E2=80=98LPASS_CLK_ID_QAIF_IF1_EBIT=E2=80=99?
   70 |         Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF1_EBIT),
      |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
/build/stage/linux/sound/soc/qcom/qdsp6/q6prm-clocks.c:15:27: note: in defi=
nition of macro =E2=80=98Q6PRM_CLK=E2=80=99
   15 |                 .clk_id =3D id,                           \
      |                           ^~
/build/stage/linux/sound/soc/qcom/qdsp6/q6prm-clocks.c:71:19: error: =E2=80=
=98LAPSS_CLK_ID_QAIF_IF2_IBIT=E2=80=99 undeclared here (not in a function);=
 did you mean =E2=80=98LPASS_CLK_ID_QAIF_IF2_IBIT=E2=80=99?
   71 |         Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF2_IBIT),
      |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
/build/stage/linux/sound/soc/qcom/qdsp6/q6prm-clocks.c:15:27: note: in defi=
nition of macro =E2=80=98Q6PRM_CLK=E2=80=99
   15 |                 .clk_id =3D id,                           \
      |                           ^~
/build/stage/linux/sound/soc/qcom/qdsp6/q6prm-clocks.c:72:19: error: =E2=80=
=98LAPSS_CLK_ID_QAIF_IF2_EBIT=E2=80=99 undeclared here (not in a function);=
 did you mean =E2=80=98LPASS_CLK_ID_QAIF_IF2_EBIT=E2=80=99?
   72 |         Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF2_EBIT),
      |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
/build/stage/linux/sound/soc/qcom/qdsp6/q6prm-clocks.c:15:27: note: in defi=
nition of macro =E2=80=98Q6PRM_CLK=E2=80=99
   15 |                 .clk_id =3D id,                           \
      |                           ^~
/build/stage/linux/sound/soc/qcom/qdsp6/q6prm-clocks.c:73:19: error: =E2=80=
=98LAPSS_CLK_ID_QAIF_IF3_IBIT=E2=80=99 undeclared here (not in a function);=
 did you mean =E2=80=98LPASS_CLK_ID_QAIF_IF3_IBIT=E2=80=99?
   73 |         Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF3_IBIT),
      |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
/build/stage/linux/sound/soc/qcom/qdsp6/q6prm-clocks.c:15:27: note: in defi=
nition of macro =E2=80=98Q6PRM_CLK=E2=80=99
   15 |                 .clk_id =3D id,                           \
      |                           ^~
/build/stage/linux/sound/soc/qcom/qdsp6/q6prm-clocks.c:74:19: error: =E2=80=
=98LAPSS_CLK_ID_QAIF_IF3_EBIT=E2=80=99 undeclared here (not in a function);=
 did you mean =E2=80=98LPASS_CLK_ID_QAIF_IF3_EBIT=E2=80=99?
   74 |         Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF3_EBIT),
      |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
/build/stage/linux/sound/soc/qcom/qdsp6/q6prm-clocks.c:15:27: note: in defi=
nition of macro =E2=80=98Q6PRM_CLK=E2=80=99
   15 |                 .clk_id =3D id,                           \
      |                           ^~
/build/stage/linux/sound/soc/qcom/qdsp6/q6prm-clocks.c:75:19: error: =E2=80=
=98LAPSS_CLK_ID_QAIF_IF4_IBIT=E2=80=99 undeclared here (not in a function);=
 did you mean =E2=80=98LPASS_CLK_ID_QAIF_IF4_IBIT=E2=80=99?
   75 |         Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF4_IBIT),
      |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
/build/stage/linux/sound/soc/qcom/qdsp6/q6prm-clocks.c:15:27: note: in defi=
nition of macro =E2=80=98Q6PRM_CLK=E2=80=99
   15 |                 .clk_id =3D id,                           \
      |                           ^~
/build/stage/linux/sound/soc/qcom/qdsp6/q6prm-clocks.c:76:19: error: =E2=80=
=98LAPSS_CLK_ID_QAIF_IF4_EBIT=E2=80=99 undeclared here (not in a function);=
 did you mean =E2=80=98LPASS_CLK_ID_QAIF_IF4_EBIT=E2=80=99?
   76 |         Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF4_EBIT),
      |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
/build/stage/linux/sound/soc/qcom/qdsp6/q6prm-clocks.c:15:27: note: in defi=
nition of macro =E2=80=98Q6PRM_CLK=E2=80=99
   15 |                 .clk_id =3D id,                           \
      |                           ^~
/build/stage/linux/sound/soc/qcom/qdsp6/q6prm-clocks.c:77:19: error: =E2=80=
=98LAPSS_CLK_ID_QAIF_IF5_IBIT=E2=80=99 undeclared here (not in a function);=
 did you mean =E2=80=98LPASS_CLK_ID_QAIF_IF5_IBIT=E2=80=99?
   77 |         Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF5_IBIT),
      |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
/build/stage/linux/sound/soc/qcom/qdsp6/q6prm-clocks.c:15:27: note: in defi=
nition of macro =E2=80=98Q6PRM_CLK=E2=80=99
   15 |                 .clk_id =3D id,                           \
      |                           ^~
/build/stage/linux/sound/soc/qcom/qdsp6/q6prm-clocks.c:78:19: error: =E2=80=
=98LAPSS_CLK_ID_QAIF_IF5_EBIT=E2=80=99 undeclared here (not in a function);=
 did you mean =E2=80=98LPASS_CLK_ID_QAIF_IF5_EBIT=E2=80=99?
   78 |         Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF5_EBIT),
      |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
/build/stage/linux/sound/soc/qcom/qdsp6/q6prm-clocks.c:15:27: note: in defi=
nition of macro =E2=80=98Q6PRM_CLK=E2=80=99
   15 |                 .clk_id =3D id,                           \
      |                           ^~
/build/stage/linux/sound/soc/qcom/qdsp6/q6prm-clocks.c:79:19: error: =E2=80=
=98LAPSS_CLK_ID_QAIF_IF6_IBIT=E2=80=99 undeclared here (not in a function);=
 did you mean =E2=80=98LPASS_CLK_ID_QAIF_IF6_IBIT=E2=80=99?
   79 |         Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF6_IBIT),
      |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
/build/stage/linux/sound/soc/qcom/qdsp6/q6prm-clocks.c:15:27: note: in defi=
nition of macro =E2=80=98Q6PRM_CLK=E2=80=99
   15 |                 .clk_id =3D id,                           \
      |                           ^~
/build/stage/linux/sound/soc/qcom/qdsp6/q6prm-clocks.c:80:19: error: =E2=80=
=98LAPSS_CLK_ID_QAIF_IF6_EBIT=E2=80=99 undeclared here (not in a function);=
 did you mean =E2=80=98LPASS_CLK_ID_QAIF_IF6_EBIT=E2=80=99?
   80 |         Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF6_EBIT),
      |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
/build/stage/linux/sound/soc/qcom/qdsp6/q6prm-clocks.c:15:27: note: in defi=
nition of macro =E2=80=98Q6PRM_CLK=E2=80=99
   15 |                 .clk_id =3D id,                           \
      |                           ^~
/build/stage/linux/sound/soc/qcom/qdsp6/q6prm-clocks.c:81:19: error: =E2=80=
=98LAPSS_CLK_ID_QAIF_IF7_IBIT=E2=80=99 undeclared here (not in a function);=
 did you mean =E2=80=98LPASS_CLK_ID_QAIF_IF7_IBIT=E2=80=99?
   81 |         Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF7_IBIT),
      |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
/build/stage/linux/sound/soc/qcom/qdsp6/q6prm-clocks.c:15:27: note: in defi=
nition of macro =E2=80=98Q6PRM_CLK=E2=80=99
   15 |                 .clk_id =3D id,                           \
      |                           ^~
/build/stage/linux/sound/soc/qcom/qdsp6/q6prm-clocks.c:82:19: error: =E2=80=
=98LAPSS_CLK_ID_QAIF_IF7_EBIT=E2=80=99 undeclared here (not in a function);=
 did you mean =E2=80=98LPASS_CLK_ID_QAIF_IF7_EBIT=E2=80=99?
   82 |         Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF7_EBIT),
      |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
/build/stage/linux/sound/soc/qcom/qdsp6/q6prm-clocks.c:15:27: note: in defi=
nition of macro =E2=80=98Q6PRM_CLK=E2=80=99
   15 |                 .clk_id =3D id,                           \
      |                           ^~
/build/stage/linux/sound/soc/qcom/qdsp6/q6prm-clocks.c:83:19: error: =E2=80=
=98LAPSS_CLK_ID_QAIF_IF8_IBIT=E2=80=99 undeclared here (not in a function);=
 did you mean =E2=80=98LPASS_CLK_ID_QAIF_IF8_IBIT=E2=80=99?
   83 |         Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF8_IBIT),
      |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
/build/stage/linux/sound/soc/qcom/qdsp6/q6prm-clocks.c:15:27: note: in defi=
nition of macro =E2=80=98Q6PRM_CLK=E2=80=99
   15 |                 .clk_id =3D id,                           \
      |                           ^~
/build/stage/linux/sound/soc/qcom/qdsp6/q6prm-clocks.c:84:19: error: =E2=80=
=98LAPSS_CLK_ID_QAIF_IF8_EBIT=E2=80=99 undeclared here (not in a function);=
 did you mean =E2=80=98LPASS_CLK_ID_QAIF_IF8_EBIT=E2=80=99?
   84 |         Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF8_EBIT),
      |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
/build/stage/linux/sound/soc/qcom/qdsp6/q6prm-clocks.c:15:27: note: in defi=
nition of macro =E2=80=98Q6PRM_CLK=E2=80=99
   15 |                 .clk_id =3D id,                           \
      |                           ^~
/build/stage/linux/sound/soc/qcom/qdsp6/q6prm-clocks.c:85:19: error: =E2=80=
=98LAPSS_CLK_ID_QAIF_IF9_IBIT=E2=80=99 undeclared here (not in a function);=
 did you mean =E2=80=98LPASS_CLK_ID_QAIF_IF9_IBIT=E2=80=99?
   85 |         Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF9_IBIT),
      |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
/build/stage/linux/sound/soc/qcom/qdsp6/q6prm-clocks.c:15:27: note: in defi=
nition of macro =E2=80=98Q6PRM_CLK=E2=80=99
   15 |                 .clk_id =3D id,                           \
      |                           ^~
/build/stage/linux/sound/soc/qcom/qdsp6/q6prm-clocks.c:86:19: error: =E2=80=
=98LAPSS_CLK_ID_QAIF_IF9_EBIT=E2=80=99 undeclared here (not in a function);=
 did you mean =E2=80=98LPASS_CLK_ID_QAIF_IF9_EBIT=E2=80=99?
   86 |         Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF9_EBIT),
      |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
/build/stage/linux/sound/soc/qcom/qdsp6/q6prm-clocks.c:15:27: note: in defi=
nition of macro =E2=80=98Q6PRM_CLK=E2=80=99
   15 |                 .clk_id =3D id,                           \
      |                           ^~
/build/stage/linux/sound/soc/qcom/qdsp6/q6prm-clocks.c:87:19: error: =E2=80=
=98LAPSS_CLK_ID_QAIF_IF10_IBIT=E2=80=99 undeclared here (not in a function)=
; did you mean =E2=80=98LPASS_CLK_ID_QAIF_IF10_IBIT=E2=80=99?
   87 |         Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF10_IBIT),
      |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
/build/stage/linux/sound/soc/qcom/qdsp6/q6prm-clocks.c:15:27: note: in defi=
nition of macro =E2=80=98Q6PRM_CLK=E2=80=99
   15 |                 .clk_id =3D id,                           \
      |                           ^~
/build/stage/linux/sound/soc/qcom/qdsp6/q6prm-clocks.c:88:19: error: =E2=80=
=98LAPSS_CLK_ID_QAIF_IF10_EBIT=E2=80=99 undeclared here (not in a function)=
; did you mean =E2=80=98LPASS_CLK_ID_QAIF_IF10_EBIT=E2=80=99?
   88 |         Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF10_EBIT),
      |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
/build/stage/linux/sound/soc/qcom/qdsp6/q6prm-clocks.c:15:27: note: in defi=
nition of macro =E2=80=98Q6PRM_CLK=E2=80=99
   15 |                 .clk_id =3D id,                           \
      |                           ^~
/build/stage/linux/sound/soc/qcom/qdsp6/q6prm-clocks.c:89:19: error: =E2=80=
=98LAPSS_CLK_ID_QAIF_IF11_IBIT=E2=80=99 undeclared here (not in a function)=
; did you mean =E2=80=98LPASS_CLK_ID_QAIF_IF11_IBIT=E2=80=99?
   89 |         Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF11_IBIT),
      |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
/build/stage/linux/sound/soc/qcom/qdsp6/q6prm-clocks.c:15:27: note: in defi=
nition of macro =E2=80=98Q6PRM_CLK=E2=80=99
   15 |                 .clk_id =3D id,                           \
      |                           ^~
/build/stage/linux/sound/soc/qcom/qdsp6/q6prm-clocks.c:90:19: error: =E2=80=
=98LAPSS_CLK_ID_QAIF_IF11_EBIT=E2=80=99 undeclared here (not in a function)=
; did you mean =E2=80=98LPASS_CLK_ID_QAIF_IF11_EBIT=E2=80=99?
   90 |         Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF11_EBIT),
      |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
/build/stage/linux/sound/soc/qcom/qdsp6/q6prm-clocks.c:15:27: note: in defi=
nition of macro =E2=80=98Q6PRM_CLK=E2=80=99
   15 |                 .clk_id =3D id,                           \
      |                           ^~
/build/stage/linux/sound/soc/qcom/qdsp6/q6prm-clocks.c:91:19: error: =E2=80=
=98LAPSS_CLK_ID_QAIF_IF12_IBIT=E2=80=99 undeclared here (not in a function)=
; did you mean =E2=80=98LPASS_CLK_ID_QAIF_IF12_IBIT=E2=80=99?
   91 |         Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF12_IBIT),
      |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
/build/stage/linux/sound/soc/qcom/qdsp6/q6prm-clocks.c:15:27: note: in defi=
nition of macro =E2=80=98Q6PRM_CLK=E2=80=99
   15 |                 .clk_id =3D id,                           \
      |                           ^~
/build/stage/linux/sound/soc/qcom/qdsp6/q6prm-clocks.c:92:19: error: =E2=80=
=98LAPSS_CLK_ID_QAIF_IF12_EBIT=E2=80=99 undeclared here (not in a function)=
; did you mean =E2=80=98LPASS_CLK_ID_QAIF_IF12_EBIT=E2=80=99?
   92 |         Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF12_EBIT),
      |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
/build/stage/linux/sound/soc/qcom/qdsp6/q6prm-clocks.c:15:27: note: in defi=
nition of macro =E2=80=98Q6PRM_CLK=E2=80=99
   15 |                 .clk_id =3D id,                           \
      |                           ^~
/build/stage/linux/sound/soc/qcom/qdsp6/q6prm-clocks.c:93:19: error: =E2=80=
=98LAPSS_CLK_ID_VA_QAIF_IF0_IBIT=E2=80=99 undeclared here (not in a functio=
n); did you mean =E2=80=98LPASS_CLK_ID_VA_QAIF_IF0_IBIT=E2=80=99?
   93 |         Q6PRM_CLK(LAPSS_CLK_ID_VA_QAIF_IF0_IBIT),
      |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/build/stage/linux/sound/soc/qcom/qdsp6/q6prm-clocks.c:15:27: note: in defi=
nition of macro =E2=80=98Q6PRM_CLK=E2=80=99
   15 |                 .clk_id =3D id,                           \
      |                           ^~
/build/stage/linux/sound/soc/qcom/qdsp6/q6prm-clocks.c:94:19: error: =E2=80=
=98LAPSS_CLK_ID_VA_QAIF_IF0_EBIT=E2=80=99 undeclared here (not in a functio=
n); did you mean =E2=80=98LPASS_CLK_ID_VA_QAIF_IF0_EBIT=E2=80=99?
   94 |         Q6PRM_CLK(LAPSS_CLK_ID_VA_QAIF_IF0_EBIT),
      |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/build/stage/linux/sound/soc/qcom/qdsp6/q6prm-clocks.c:15:27: note: in defi=
nition of macro =E2=80=98Q6PRM_CLK=E2=80=99
   15 |                 .clk_id =3D id,                           \
      |                           ^~

--uWz5LYfO0GfAdVdb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmp7Z5cACgkQJNaLcl1U
h9CP8gf+OgDfYf8RD8UpqG1cZWggtfajfEZdCu3aRyTzqpgwvZS1Vkn+uotbOwQE
+B6fTosSuz2ftHGTss8szPez5cCgbWZEWkdoC+0P86GNH6ao0oW3QsETRiO4Oe/L
0kxhDNjD5jjswuZt6nuJFRYJ2U4FKgsT5NF/XZn+l/xjLmpVtpUJ6rabiEthva/l
p5852na2z36OIXJmo3h2LJfZ5Api/+18DbTcXlLY4Lr2fNoWB6aXs1w9dXSAhfEP
Kl9WG84nAVM1kSaS6iZNN87r5RbL0uRIwBB3VeQA/H8hcH6j2FHO1ZyVzVGCbKzU
UBgDSipF3LYZWLnd7N42QjlueDKXeQ==
=ovaN
-----END PGP SIGNATURE-----

--uWz5LYfO0GfAdVdb--
