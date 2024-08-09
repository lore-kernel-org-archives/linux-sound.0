Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com [209.85.218.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8EA2197545
	for <linux-sound@vger.kernel.org>; Fri,  9 Aug 2024 13:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723211794; cv=none; b=PtHmZ2Cq/GecLacPqIv3lob3bDKxxt9pw47ahksNZ3yyd96vy9JCcsE71Yz7IpnTJoPUtZwR+k61d61Fp0PVeWKfeWEkXVdl/EHikoiFPahtiEnZRd8tl1ht7XwZwM9x1u3chWOVQgFUUcoKNUN5e/jh5E4z0BLL+A1KmpstljM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723211794; c=relaxed/simple;
	bh=joEsW0FPclCgeTP/uZhNMA4eTGTaHw/9JpAdYifIg0A=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=FS+2Y/rpHo/2aD1gOK0HpeToZ4UkT6tGJhY5W5k8v8Zqt1Gqk+5c3hySKXMhAaKpSp7cF7NM/aNefMhHaXxGj7XeN6CxjlfpzO4D3bJkQKzPCIlEXLHtwHBzrMo3L3kGPcTTVHD2q64VZ4qStC5TWPmxZU2qW6AJ+JjWz3emzDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jakiela.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=i8VMc+8j; arc=none smtp.client-ip=209.85.218.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jakiela.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="i8VMc+8j"
Received: by mail-ej1-f74.google.com with SMTP id a640c23a62f3a-a7a83fad218so162935266b.3
        for <linux-sound@vger.kernel.org>; Fri, 09 Aug 2024 06:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723211791; x=1723816591; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uwWk5vwNUnHr+77nmp11wy93oHye7pIINgENe6fRVDM=;
        b=i8VMc+8j8b7qUDEyy+TFH+4sHi7oRj1/W9haFsSHRq0ttvjEPdStEiLW8yLDNRb3qR
         INxzKYWm6k7JR+qIRuilfhoPmzz+Jss/9XKRVeq9cItDKW0wALpX1Wyp4rCdYyED55pZ
         kePr3DvpaCOcqN+R9tYkrP9zn/LR68v+W2uz8YNFbyqLbe+N/nvsnpGUrUicjv+/i+eo
         yPMCpwaTcIvgFwBUqWFUJ1eLrlWD7b90GatevolcbUpJSDV8BcT1nzOHca2ZCU34OOG0
         4n3jKGDhPMHKuM7/u6FpK0Cs7yHzHdOb19nUftTeCY3ahqJSrx/Sv+HkwmbpHryUAmZ6
         nJqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723211791; x=1723816591;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uwWk5vwNUnHr+77nmp11wy93oHye7pIINgENe6fRVDM=;
        b=YcIvSgUjk1Q2JghhQk/WdCeBWhmhO8473m7ZDqg1GZ0prNuQOfCz8+aAda0Os+XFwl
         Oxcd8XN6ZtfPnaaT24b8QinxVZd3zYNT06OlQ/Hwd+9nIWGjUZBn8U+Uj9D+Omr8gBsy
         Y7b6Ltj9XBL+NJ2+0X1mNgjZ11p1KGaar6WgP+lqJePeD4UiWhM4Q+C5RKmTU2IjuSsV
         uqEUV9h2dxoFHF25sdgNnkRpFGtSCM/Rzm+meOgvNKJE2ksDS/b4E0bKCblCH9G/8UDq
         hi5jNDi2OrKl482jaj81MKqE4iPl0+sMwdYO/v3NCw/7bmJNn/WYLvuKYYCEAq4NlT3j
         eBGA==
X-Forwarded-Encrypted: i=1; AJvYcCW0oyhWEAAalP8hTgw9GCB0aQuYTv8LG2fVyNIUBw4Zuu3ACA/PT/NQaktrQ7Zawu4wMipxsf/DZTV3pqxb8ypq/CL1HE+qi34dJnI=
X-Gm-Message-State: AOJu0YxGFqUtCogRoj4MKpdGq0PkoanKJrPoV3LBLb/pJqKY1It6Orrv
	I73h+UvD5awlHly2kWgp+B/nz4sfmgY2LPBaICIgbd+rZ+SY1YXhd8hXUeK+0V7nGm6lkx6a5KN
	4LBkf+Q==
X-Google-Smtp-Source: AGHT+IHTFysFkH00C3hYStK8EkgJdzcGP4KO954ojilgedv2Hci67RKYhM3aoedZy3R2ZJ37NGm+OqWn8ZtP
X-Received: from malysz.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:a1e])
 (user=jakiela job=sendgmr) by 2002:a17:906:3da2:b0:a7a:83af:b875 with SMTP id
 a640c23a62f3a-a80aa65fa8fmr168466b.12.1723211790925; Fri, 09 Aug 2024
 06:56:30 -0700 (PDT)
Date: Fri,  9 Aug 2024 13:56:27 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.46.0.76.ge559c4bf1a-goog
Message-ID: <20240809135627.544429-1-jakiela@google.com>
Subject: [PATCH] ASoC: SOF: mediatek: Add missing board compatible
From: "=?UTF-8?q?Albert=20Jakie=C5=82a?=" <jakiela@google.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	"=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=" <u.kleine-koenig@pengutronix.de>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Trevor Wu <trevor.wu@mediatek.com>
Cc: sound-open-firmware@alsa-project.org, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, 
	"=?UTF-8?q?Albert=20Jakie=C5=82a?=" <jakiela@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Add Google Dojo compatible.

Signed-off-by: Albert Jakie=C5=82a <jakiela@google.com>
---
 sound/soc/sof/mediatek/mt8195/mt8195.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/sof/mediatek/mt8195/mt8195.c b/sound/soc/sof/mediate=
k/mt8195/mt8195.c
index 24ae1d4959be..d4f320a03971 100644
--- a/sound/soc/sof/mediatek/mt8195/mt8195.c
+++ b/sound/soc/sof/mediatek/mt8195/mt8195.c
@@ -574,6 +574,9 @@ static struct snd_sof_of_mach sof_mt8195_machs[] =3D {
 	{
 		.compatible =3D "google,tomato",
 		.sof_tplg_filename =3D "sof-mt8195-mt6359-rt1019-rt5682-dts.tplg"
+	}, {
+		.compatible =3D "google,dojo",
+		.sof_tplg_filename =3D "sof-mt8195-mt6359-max98390-rt5682.tplg"
 	}, {
 		.compatible =3D "mediatek,mt8195",
 		.sof_tplg_filename =3D "sof-mt8195.tplg"
--=20
2.46.0.76.ge559c4bf1a-goog

