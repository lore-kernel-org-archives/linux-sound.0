Received: from o129.p8.mailjet.com (o129.p8.mailjet.com [87.253.233.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4968F389DF3
	for <linux-sound@vger.kernel.org>; Sat,  4 Jul 2026 12:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=87.253.233.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783169514; cv=none; b=CQI86S2nwtfIgJqRODmr3lk8VERyNMJ6cnnXZfefVvd1Usq1ljAd7rl5g/JEZD30VgtUWoHp1q5JU2wtp+eeHBTOkuX+RXBX4+VJpN/wwLPoAJgOmTg+9+XZAM+1gHBhatUqJecq/VBqzgMwkzIGWxc2OJMiwsUSXp+6fVOq68U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783169514; c=relaxed/simple;
	bh=BSWgqMr/x7kwnfZQG/BmZ3AKk13D+4tUYC4TS8T8LbM=;
	h=Message-Id:MIME-Version:From:To:Subject:Date:Cc; b=msmf01j2Ady86ju16TJQ6/2oD1aDu8uR8WGK4tn+Zw2Bgjcb90+vjJkNCGaDek6JcMZM8Lx0euVKCESUF8M53bviqoImNZkrx+VNGRuSCX+8CF//Fzlv5iMGJy4bT8vhb/iqpIjPDP9XpKzmZDC7wEcLa0Pf1aOQsi1AzZCwY4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=marcogriep.de; spf=pass smtp.mailfrom=a3417383.bnc3.mailjet.com; dkim=pass (2048-bit key) header.d=marcogriep.de header.i=mail@marcogriep.de header.b=Qfnax9Wi; arc=none smtp.client-ip=87.253.233.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=marcogriep.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=a3417383.bnc3.mailjet.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marcogriep.de header.i=mail@marcogriep.de header.b="Qfnax9Wi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; q=dns/txt;
  d=marcogriep.de; i=mail@marcogriep.de; s=mailjet; t=1783169504; x=1783176704;
  h=Message-Id: MIME-Version: From: To: Subject: Date:
   List-Unsubscribe: List-Unsubscribe-Post: Cc: Feedback-Id:
   X-CSA-Complaints: X-MJ-Mid: X-MJ-SMTPGUID:
   X-REPORT-ABUSE-TO: Content-Transfer-Encoding: To: From:
   Sender: Subject: Date;
  bh=UYN5jsbmUUeSHehqAT+G2SJu/+i6vwtruT+zrtYLoTs=;
  b=Qfnax9WirZE/+S1DGVnJD8wUpNvj3iJKczbbHda+QZwfGCsIvXuobke12
 V2saczwUuJETHdCEeMP7yXTi8G37BcIPoAVMHY9NSvefXbxhcHut7bqVnfnA
 UeUdMP/MJIuUPExk+sEiCOvV2YRqJUzKyCIeTz2supsp/Dj5U3jZDMHs/yof
 j7y/oQdyV/efiORvjWBgHSngL6QlFLPUay/Pbm4O3GjggAzOttQiXjqIRUN5
 1BDfEI/eKL7U5LYARZ2dfjjVdjAaU8iD8A4CUjZ3OY4dmyXePwka4J5vFjLr
 V+c+sJfn9VPvlXgylJf0DtiiIteggZpCwO0ilU4t39ypw==
Message-Id: <30dd273a.AVwAAJ-gc7kAAAAAAAAABGg7al0AAYKJ_u4AAAAAADQlJwBqSQHg@mailjet.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Marco Griep <mail@marcogriep.de>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: sdw_utils: Add RT721 speaker component tag
Date: Sat,  4 Jul 2026 14:51:19 +0200
List-Unsubscribe-Post: List-Unsubscribe=One-Click
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>, Kuninori Morimoto
	<kuninori.morimoto.gx@renesas.com>, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, Marco Griep <mail@marcogriep.de>
Feedback-Id: 42.3417383.3105730:MJ
X-CSA-Complaints: csa-complaints@eco.de
X-MJ-Mid:
	AVwAAJ-gc7kAAAAAAAAABGg7al0AAYKJ_u4AAAAAADQlJwBqSQHgJxK4JETCQd6srW_fkmJi6wAvY8I
X-MJ-SMTPGUID: 4971d933-2385-4421-91e6-0a3ab143734e
X-REPORT-ABUSE-TO: Message sent by Mailjet please report to
	abuse@mailjet.com with a copy of the message
Content-Transfer-Encoding: quoted-printable

The RT721 multifunction SDCA speaker helper adds the DAPM routes for
its internal speaker path, but it does not add the corresponding
spk:rt721 token to card->components.

UCM uses that token to include the RT721 speaker device. Without it,
systems with standalone RT721 expose the ALSA SmartAmp PCM but PipeWire
only sees the headset devices.

Append the speaker codec token from the RT721 multifunction SDCA speaker
runtime init path so UCM can create the internal speaker route.

Tested on an ASUS Vivobook S16 M3607GA with ACP70 SoundWire RT721-SDCA.
With the standalone RT721 ACP70 machine entry, this makes the HiFi
profile expose Speaker, Headphones, internal Mic and Headset devices.

Signed-off-by: Marco Griep <mail@marcogriep.de>
---
 sound/soc/sdw_utils/soc_sdw_rt_mf_sdca.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/sdw_utils/soc_sdw_rt_mf_sdca.c b/sound/soc/sdw_utils=
/soc_sdw_rt_mf_sdca.c
index 5bf3627a97a0..e895397eefd6 100644
--- a/sound/soc/sdw_utils/soc_sdw_rt_mf_sdca.c
+++ b/sound/soc/sdw_utils/soc_sdw_rt_mf_sdca.c
@@ -74,6 +74,12 @@ int asoc_sdw_rt_mf_sdca_spk_rtd_init(struct snd_soc_pcm_=
runtime *rtd, struct snd
 		return -EINVAL;
 	}
=20
+	card->components =3D devm_kasprintf(card->dev, GFP_KERNEL,
+					  "%s spk:%s",
+					  card->components, codec_name);
+	if (!card->components)
+		return -ENOMEM;
+
 	/* Add routes */
 	ret =3D snd_soc_dapm_add_routes(dapm, route_map->route_map, route_map->ro=
ute_size);
 	if (ret)

base-commit: 1e9cdc2ea15adf4a821eefedabf6c0c8cf0b6a55
--=20
2.55.0

=
