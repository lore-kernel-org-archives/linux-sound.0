Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794395359;
	b=CRlMdsXzSpI9wR1Olpz/+v+9rCuGiyD1y+4+4jgMpMkuT0ZoJkp8yUsrsLmFOkaTvJxG
	 Iw2vICu5Tnmrk817rjNALO+J08p8EuqnyWxeAGEObm9r1GwbH8DO84WyRMmljUSd7Tp03
	 urOkg6Rs/zZfmnFIp24eNfhDlbMHMgMhmoExTEOReIICwM9K5w1W+NBNOQXa72R+hvt4v
	 uobHqaeyKzow4yIILEIc9rPZSdUtoMU9/fL56lKqRg9IsD+3aB6Kke2ut/bXG/7SjUD3X
	 50BBr6T5ooX3CrHcs2CqRfdzO4Dtoe3TmQQAFY7s+/1nf8ma/IAWB57Db2xKtnjUeVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794395359;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=KiFnn/KByRC6NQAd3sXlrVRN8NYCmQwYmfBEaqlqXmY=;
	b=J70z4avyQTEqjk3ORxQ12IWvBdVxDcRQue5++2GhdNYWrzSwvl4IgJZE79trAlzG26PE
	 UAnrNwitTwjDpvdFe+jWEKS5pHStvPHwHVmmXCxzaQp+lvEeuk+89E2+0dCj0EYFDZHpu
	 bresPxtJ13k9RG2ktrLgckxZLMmrBxrQVsMVtYk8R4U9NrXRkirp46jLpod/04As5Rr5E
	 4O7QPrn2Pvb4NpPtJJbA+SOwz7EcF+zptoO4zkZLmhST7GOCkLQaveMYjo6RhXjZWASqn
	 yLblWA7v0f5ol7IEcCCwAjRlW3stXOdTXN96velfgRQCCqyjlUoEOjGxJTO4symskEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZSQTEscr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B84A9606A331
	for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 11:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZSQTEscr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E93F1F00A08;
	Wed, 11 Nov 2026 11:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794395359;
	bh=KiFnn/KByRC6NQAd3sXlrVRN8NYCmQwYmfBEaqlqXmY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZSQTEscrIQ/cM1k3uxbCwyZcQfKLB7QQw4f3aih2VicaDQtoudXlrn4q/k6duzRYm
	 B72G5UWbd192VzqzWc4Fpxeic2hL6ytJHcc2OaOdgAp47D6rE6EIYkLD9T6uT+r6A5
	 MB67cS1nMvwDER4gPgw9qQNTq46aomqe4gTPS8TLPukF/3a4X6a9vTwBKwSOIgjhHo
	 ZK9k+geJJF1+9kj/weT8ZkhR0NU1Qqyyq/HVHrA8bIwTNAjJiqnF/+LjHXYsuYv5e6
	 GU9OtM1FUhYpB5bs2We2M60KIiV3iUWHHQ0fF8xJYWNtvDEB+JrwaAxjDUf/y6NXwE
	 SYo5LL2QHnNGQ==
Message-ID: <sashiko-outbox-208851@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] ASoC: qcom: audioreach: only disconnect the route a
 mixer control owns
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marc Herrero" <marcht@proton.me>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261111-q6apm-fixes-v1-2-1beb5702b372@proton.me>
References: <20261111-q6apm-fixes-v1-0-1beb5702b372@proton.me>
 <20261111-q6apm-fixes-v1-2-1beb5702b372@proton.me>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 11:09:18 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] ASoC: qcom: audioreach: stale DAPM path in
  audioreach_put_audio_mixer()
--

commit 1fff20ab243038af732f562aca3ace62e5fdcdb9
Author: Marc Herrero <marcht@proton.me>

ASoC: qcom: audioreach: only disconnect the route a mixer control owns

This commit checks audioreach_is_vmixer_connected() before disconnecting
a virtual mixer route when 0 is written to an AudioReach mixer control.

> diff --git a/sound/soc/qcom/qdsp6/topology.c b/sound/soc/qcom/qdsp6/topol=
ogy.c
> index 612d8f03e6e98..e92408e09bac6 100644
> --- a/sound/soc/qcom/qdsp6/topology.c
> +++ b/sound/soc/qcom/qdsp6/topology.c
> @@ -1300,7 +1300,7 @@ static int audioreach_put_audio_mixer(struct snd_kc=
ontrol *kcontrol,
>  	if (ucontrol->value.integer.value[0]) {
>  		audioreach_connect_sub_graphs(data, scontrol, dapm_scontrol, true);
>  		snd_soc_dapm_mixer_update_power(dapm, kcontrol, 1, NULL);
> -	} else {
> +	} else if (audioreach_is_vmixer_connected(data, scontrol, dapm_scontrol=
)) {
>  		audioreach_connect_sub_graphs(data, scontrol, dapm_scontrol, false);
>  		snd_soc_dapm_mixer_update_power(dapm, kcontrol, 0, NULL);
>  	}

[Severity: High]
Does gating snd_soc_dapm_mixer_update_power(dapm, kcontrol, 0, NULL) on
audioreach_is_vmixer_connected() leave kcontrol's DAPM path stuck
connected when switching front ends?

All front-end kcontrols on the same virtual mixer widget share one back-end
audioreach_graph_info->src_mod_inst_id, whereas each kcontrol owns its own
struct snd_soc_dapm_path in DAPM.  If front end 1 is enabled (setting
path_1->connect =3D 1) and front end 2 is then enabled before front end 1 is
cleared, audioreach_connect_sub_graphs() overwrites info->src_mod_inst_id
with front end 2's module instance ID.  When 0 is subsequently written to
front end 1's kcontrol, audioreach_is_vmixer_connected() returns false and
skips snd_soc_dapm_mixer_update_power(), leaving path_1->connect set to 1
so DPCM continues to treat the back end as connected to front end 1.

Only audioreach_connect_sub_graphs(data, scontrol, dapm_scontrol, false)
should be guarded by audioreach_is_vmixer_connected(), while
snd_soc_dapm_mixer_update_power(dapm, kcontrol, 0, NULL) is still called in
the else branch.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111-q6apm-fixe=
s-v1-0-1beb5702b372@proton.me?part=3D2
