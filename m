Received: from mail-0201.mail-europe.com (mail-0201.mail-europe.com [51.77.79.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B0D17C220
	for <linux-sound@vger.kernel.org>; Fri, 16 May 2025 10:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.77.79.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747393146; cv=none; b=WqFNfmgdG10ifEgyhfBdr2uFBiwDy4hlx1pP1JGVDHZWcNb5KEJwvzzZPx0mttsn3c7wyklV+t2jmSsJ4WsHQwHpZVvtW/OwqQAGMRuj1ek1fu4xs4IQr4GUt3lsgtrtMj+Is2Id1z2N9WyzoAhJaEXp2C+SbVSaXxLpiZRa1II=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747393146; c=relaxed/simple;
	bh=1iTX8zO8RxEEn7ZG+JkV00xvCrMAAk8Bwqqj3UXRgGY=;
	h=Date:To:From:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kMeger0M4ZA/8GFiEDbr8dBLJL1M0sCExNsdHcM3k1jtm19d1sySjrGlMyOJsxwJHgRxY3GYIjYkcWZYI432MazPeHddVcYizUlw2hANMQnF/EB+uci2rxs7P59ZnA1uYJ+vgtloLFeJ8ktgmZqkdlqBp3oVscf2wRqGbt7Cnbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nxsw.ie; spf=pass smtp.mailfrom=nxsw.ie; dkim=pass (2048-bit key) header.d=nxsw.ie header.i=@nxsw.ie header.b=cYZ8v2z0; arc=none smtp.client-ip=51.77.79.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nxsw.ie
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxsw.ie
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxsw.ie header.i=@nxsw.ie header.b="cYZ8v2z0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxsw.ie;
	s=protonmail2; t=1747393134; x=1747652334;
	bh=TaiY7MHbYJH8WdterRCgzeSyGBcWZ5e3MakgNM9hcDo=;
	h=Date:To:From:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=cYZ8v2z0llsBf0OPUpzkYHbfOxkbhejhGyVyOoOvxic57Wf1+ePzZcn1RE5sYuPPg
	 d43QZRXfCsXzI33J13TD4vq99fole9EyIgG0Xio5THkQwhdw0ZKqBppQyAmPSuTj74
	 P6IBUN8NKPGey0tmXMNXsmSpMmjZkymy8ul9Ux/Ieyg0GYu2vktrY2u3TA43vckt0T
	 BysMYBTykZuS/u+ZCxul1CURkDLoEmCgvs/TFftby/uBfQLSp2TD/bGIvRqe6pis+3
	 Eu/VQcRHB3ZB7Bfnk212B5Bzet9MScbEOjhOIqOt+qXzDxxMWwVvWBrmuehlX41+hT
	 w35npcADX8suQ==
Date: Fri, 16 May 2025 10:58:49 +0000
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org
From: Bryan O'Donoghue <bod.linux@nxsw.ie>
Subject: Re: [PATCH v3 0/3] ASoC: remove component->id
Message-ID: <b677f119-a703-4a40-b93a-2e673e6ba4d5@nxsw.ie>
In-Reply-To: <87bjrttmbe.wl-kuninori.morimoto.gx@renesas.com>
References: <87bjrttmbe.wl-kuninori.morimoto.gx@renesas.com>
Feedback-ID: 136405006:user:proton
X-Pm-Message-ID: 374b6143765428b9b58d109b9de38e8096ca98ad
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 16/05/2025 01:45, Kuninori Morimoto wrote:
>=20
> Hi Mark, Srinivas, Qcom members
>=20
> snd_soc_component has "id", but no one is using it except Qcom. It is
> initialized at snd_soc_component_initialize(), but Qcom overwrites it.
>=20
> According to Srinivas, unfortunately, current Qcom lpass is broken.
> But we can update it and then, avoid to use component->id.
> Let's do it, and remove it.
>=20
> Kuninori Morimoto (2):
>    ASoC: soc-core: save ID if param was set in fmt_single_name()
>    ASoC: remove component->id
>=20
> Srinivas Kandagatla (1):
>    ASoC: qcom: use drvdata instead of component to keep id
>=20
>   include/sound/soc-component.h   |  1 -
>   sound/soc/qcom/lpass-platform.c | 27 +++++++++++++++++----------
>   sound/soc/soc-core.c            | 14 +++++++++-----
>   3 files changed, 26 insertions(+), 16 deletions(-)
>=20

Your commit log should contain what has changed between one version of=20
your series to the next.

V4:
- Added a description to my commit log cover letter

V3:
- Made the declarations of variables reverse christmas tree - Konrad

V2:
- Made changes to indentation - Konrad

V1:
- Awesome new silicon enabling code I wrote

---
bod

