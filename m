Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793779931;
	b=b5/i7gOYpryXcRIl2ZLkcto6r7M83qbOmyGRADQwxRPhthxEA6LOLEEKtiFRygc6tswG
	 vuKpdlbRsuQgE5rQMWAzNID2+OwuinSoUNrL1EtMI0lc3xtUFOj8N4abkQ+Ii1pDYQQ3S
	 /xIDjyDNFgynf+3kJBzlD1UX8V12kTTG2IbnNk2/XT2bxG7jUdB/kgfcpUyH5jSNtZtiV
	 8J1wCeMtX7dDmlatmeEgiFgPAPtnLp7472krgTPyqTcONXnLNfufEvl55X5QzUTduyO2z
	 fxiFIkZiWz272NmgJk+HxW87My1I4LO0w0lSB/3Ztt/pmDa9rSozwIujRqrPEae6kdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793779931;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=omKJmZPQPbQeP7ITErPhX0hFXTUXvZIaGOnS5hhkmhI=;
	b=0yU7TmVRu/1YFsLLFzIi8cUxDXQ+5bV9xRjtz0JWPLWZDeRaPTY2T5oJeJrLn4pQegZw
	 vdxW9LiCctMNlKS4TlnHHmUiNumLtWzHAki31+FmqUolwcT6HLvG5lMvgtti+iptx150p
	 7s7NCZI9sAIBvPl2SyFNo36sEERIzHhqgkxGmTnlROsujmBVHCENrYzmJcQUMlAOfQZye
	 wMAY+q9dNcV+cEhJWkmrEIV92GM2zcTd5fBQYqahjUhgkzqZYEE4sAyAnutQ9hjPs8LqF
	 099Y6UCxLWBZ2RcCY+B8RuUUClSivuqvUp6hca/4lNhaJuJkBi+S3kTkWj9PojCfcag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WQGssLsF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE1AD606A31B
	for <linux-sound@vger.kernel.org>; Wed,  4 Nov 2026 08:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WQGssLsF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 658C01F00919;
	Wed,  4 Nov 2026 08:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793779930;
	bh=omKJmZPQPbQeP7ITErPhX0hFXTUXvZIaGOnS5hhkmhI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WQGssLsFoLcZ7F8/gYAjmLd39d70taX0TtIqK8droIHw3V5PTTE2oIm8FUJB6+rcA
	 +lKubExNI7ZC4MQrbI9F8fWfMNamyOrO+enM8HjFMKh7FN2fnsiT1CXofdiK7efPB+
	 wr5eFX8n//6U4D5lcw3SzPmm/UiigWiyxw1zPBIKPtnywcR78UOlb7eCja5rbEHzVB
	 0eXa8cbiGNYVbGPwAYXcePGP8jq7F/XqQtrBt2j11CV5mSZvycrwpxPDeUfm9VHl43
	 2AlYHbcLcGixvkZDXldL5hSMLw48Hl2m2PBtnGBQ4r2cgpfqOXgAwOTmq8iiQ0AGU6
	 D84q87t+abm2A==
Message-ID: <sashiko-outbox-196862@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] ASoC: cs42l43: leak MCLK when PLL enable fails on
 PRE_PMU
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tang Bin" <tangbin@cmss.chinamobile.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261104080257.1144-1-tangbin@cmss.chinamobile.com>
References: <20261104080257.1144-1-tangbin@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 08:12:09 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] ASoC: cs42l43: double clk_disable_unprepare() in cs42l43_pll_ev()
--

commit 22be724b77049d9bdd49902edcd96899ee4749da
Author: Tang Bin <tangbin@cmss.chinamobile.com>

ASoC: cs42l43: leak MCLK when PLL enable fails on PRE_PMU

This commit disables and unprepares MCLK in cs42l43_pll_ev() if
cs42l43_enable_pll() fails during SND_SOC_DAPM_PRE_PMU.

> diff --git a/sound/soc/codecs/cs42l43.c b/sound/soc/codecs/cs42l43.c
> index b6238f89c789c..6f308ea227fb6 100644
> --- a/sound/soc/codecs/cs42l43.c
> +++ b/sound/soc/codecs/cs42l43.c
> @@ -1625,6 +1625,8 @@ static int cs42l43_pll_ev(struct snd_soc_dapm_widge=
t *w,
>  		}
> =20
>  		ret =3D cs42l43_enable_pll(priv);
> +		if (ret && priv->refclk_src =3D=3D CS42L43_SYSCLK_MCLK)
> +			clk_disable_unprepare(priv->mclk);

[Severity: High]
Does this cause a double clk_disable_unprepare(priv->mclk) when the widget
later powers down?

In sound/soc/soc-dapm.c, dapm_seq_run_coalesced() sets w->power before
running SND_SOC_DAPM_PRE_PMU:

sound/soc/soc-dapm.c:dapm_seq_run_coalesced() {
	list_for_each_entry(w, pending, power_list) {
		WARN_ON(reg !=3D w->reg || dapm !=3D w->dapm);
		w->power =3D w->new_power;
		...
		/* Check for events */
		dapm_seq_check_event(card, w, SND_SOC_DAPM_PRE_PMU);

And dapm_seq_check_event() only logs an error when w->event() returns a
negative value, without rolling back w->power:

sound/soc/soc-dapm.c:dapm_seq_check_event() {
		ret =3D w->event(w, NULL, event);
		trace_snd_soc_dapm_widget_event_done(w, event);
		if (ret < 0)
			dev_err(dev, "ASoC: %s: %s event failed: %d\n",
			       ev_name, w->name, ret);

Because w->power remains 1 even when cs42l43_enable_pll() fails, DAPM will
still run the SND_SOC_DAPM_POST_PMD event when the audio path powers down:

sound/soc/codecs/cs42l43.c:cs42l43_pll_ev() {
	case SND_SOC_DAPM_POST_PMD:
		ret =3D cs42l43_disable_pll(priv);

		if (priv->refclk_src =3D=3D CS42L43_SYSCLK_MCLK)
			clk_disable_unprepare(priv->mclk);
		break;

Wouldn't disabling priv->mclk in the SND_SOC_DAPM_PRE_PMU error path cause
SND_SOC_DAPM_POST_PMD to call clk_disable_unprepare(priv->mclk) a second
time and underflow the clock enable and prepare reference counts?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104080257.1144=
-1-tangbin@cmss.chinamobile.com?part=3D1
