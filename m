Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96DBC47B413
	for <linux-sound@vger.kernel.org>; Tue,  4 Aug 2026 18:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785869684; cv=none; b=PU4soAzkWMk8Li//GoT5q4MOOwArSw77DqdmmiMA+F4dx2fEtGzRO9/u6cp16uB60+AM2bqcuI3P0Z/paymZAztqtx1kzXxpLtx8ZRuOA5a9u0yFSBuGr1mZ/thVNcMqcg79cAS2RDOyu3ZcyPp3qVkeI6rgNrunnytcDWxml0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785869684; c=relaxed/simple;
	bh=ZYrhwh9oc3u0M3XIruGkd2kcdQc4AfuyYHu+UNHYYDw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U/I3QdbXYmxP1+kIPQOA+WtIO36DEZYqRyqf3aK97Ias+2Jgf5J1vq2Cjt4R94RLLY9C5wNDqRB1Km7HoTE3U7mloOOqG4C9f1DwTN0JFQu28RVCgkC+b94Ix/FIqh9PMFvFdbNyF1JvcsG3X0K6k4k6Ze547hbCnuL+hEO1U4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sl6eu22T; arc=none smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sl6eu22T"
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-499f6e0bbabso119384b6e.0
        for <linux-sound@vger.kernel.org>; Tue, 04 Aug 2026 11:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785869682; x=1786474482; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eX21RT8e6RNPJawrt6q+NGBBbfh20E5vlyJu48ApSvc=;
        b=sl6eu22T6WI7Aos2pXRQTC0DJ9AwEFu1ZBiCBt8oYsqmSVkzLSerKT0f97C1yewtSh
         kHvHAzJPV7oElzK/qvd4s3uCSfC67YGKNa2QhLJrvG2LZ9opzmAW7HSxXUawOEXKJNo5
         pDUtn6t9g4aLp0JIApk+31+I15lkTlDBelf7j8aqKCZnpZTts/bt+UJ2u2gWN0sXTl5Q
         u5pkJG6636a8WtAqWsvZ1LdL4nP9zimkgTZkznZ2M5jOF/HCOWISL57YH4gnln9Ity2M
         q2ymhhtDUQ00InUj9V1eCRS8lWyX3xNmC+CnTF5I1pjFH1yAVhu6FOfvf+GjHWC7a/lc
         +YWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785869682; x=1786474482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eX21RT8e6RNPJawrt6q+NGBBbfh20E5vlyJu48ApSvc=;
        b=AfPGK5v7jWhxQESR7TZ+1sWiuaXiLQ7qCeBlKB+4cNK8/M0NxmPjrC3ItDuPYBxqA1
         6W/BWqhxc5DDRa6O4XYwIPmIgpHE+x0KawNOjLZ5c18tMzRxE4i9J11daEeg52Eb8TC+
         3so+16DaEB/2LSSeGSDCR0wTe2NUvFXLwSpdjsvLwZRgBL+1+6TbQ+DwpYpbqASk/4MF
         ba2T0NtU7ZkH0DWmSPbiNIjUM0+HES+X8n19LRlmSD5oxG7rEhvZ+fOv3axWADZLYXOb
         7Xtwem4EDmilk3Ai20rVvug8yTD2K+p1hVhIM7ZyY0Qsx9P/B4xMSESsdXQn2o1IPBR3
         D3tQ==
X-Forwarded-Encrypted: i=1; AHgh+RpXqujVaqcgYSBfOK/dgxxOIP3B8cHrt9qZrXfM/1dIaqQWdNiujXyOjVlYtsPXpDq5LaIr4WTt6oljvQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw21tLlfhaMRqPH7f0cmS9y13tct0X7lz2wDPUTl75fVzagQYKC
	xL0sZxxYu5BI8ObC7eNpmv2SjhPKQaCfSXG1Ksk36KjBSHseQ5SMGtvA
X-Gm-Gg: AR+sD12pOs0uuCyUO4BFFTT/pzEvkRIAh09jK4OerqGC8Ca5kON6NIM4UXqhxnRJr2l
	BLn4Cb/utRXWwKuCK5lubU8xT/0940DJpaMTK66Ug114j8Jib5QPt3gRQVHAMz/ngqVegV8/+Rt
	1SUIgmD7FHLagEBPBDvgsjjjy5A7L6cvJhFqZC40HbpAhjtN2R7DTc32MIuVLAs9wEapQzwLU8E
	sfzz0noBpIHHENYf0Ls9FOcRdgvKfeBy42/oQV7QBW2/ouFvd8PciElfeLE3IlPy/aJHXK3EB1F
	fpNhDprPobHLQ1RZHhJPKGdSbDKiwr1+sN0np9VGMhJMDR/Sbr8MF0pu63O3ba7+AgdN+iq9O+d
	yS9TkDzTwL/6JYaVPl3aHElHSqjxkhgdkjuGDP468wxE0+rqgyBX/EZPEUxhwksfxXCFQUJae+4
	Nn8IItk+GspD6UCzGfuyIUWXZSriI//Uur1OU+Y0oj1GupKkY=
X-Received: by 2002:a05:6808:1508:b0:4a3:d66b:240b with SMTP id 5614622812f47-4afae0669acmr393997b6e.18.1785869682563;
        Tue, 04 Aug 2026 11:54:42 -0700 (PDT)
Received: from pc-i7 ([192.3.12.183])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4afae458389sm178119b6e.2.2026.08.04.11.54.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 11:54:41 -0700 (PDT)
From: Aaron Ma <mapengyu@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	marco_giunta@outlook.it
Cc: Zhang Heng <zhangheng@kylinos.cn>,
	Kailang Yang <kailang@realtek.com>,
	Damien Dagorn <damien.dagorn29@gmail.com>,
	Bob Song <songxiebing@kylinos.cn>,
	Lei Huang <huanglei@kylinos.cn>,
	Sean Rhodes <sean@starlabs.systems>
Subject: [PATCH v2 2/2] ALSA: hda/realtek: Limit Legion AW88399 playback to stereo
Date: Wed,  5 Aug 2026 02:53:25 +0800
Message-ID: <20260804185325.22861-2-mapengyu@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260804185325.22861-1-mapengyu@gmail.com>
References: <20260804185325.22861-1-mapengyu@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Legion AW88399 speaker routing sends a stereo FL/FR stream
to both speaker pairs. A four-channel stream leaves the front
pair silent, so advertising four channels exposes an unusable
playback mode.

Limit the analogue PCM and the multi-output runtime constraint
to two channels for the affected Legion codec SSIDs. This
exposes the usable stereo configuration and rejects
four-channel playback.

Signed-off-by: Aaron Ma <mapengyu@gmail.com>
---
Changes in v2:
- Based on the original 2/3 (39adb275a45cd "Use quad channel map for
  Legion AW88399 speakers"), reworked: instead of advertising a quad
  channel map, playback is now limited to stereo because both speaker
  pairs carry the same stereo signal.

 sound/hda/codecs/realtek/alc269.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 30d71575bac3b..1231d9bfeeb16 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -3291,6 +3291,10 @@ static void alc287_fixup_legion_16iax10h_aw88399(struct hda_codec *codec,
 		spec->gen.suppress_auto_mic = 1;
 		snd_hda_override_conn_list(codec, 0x17, ARRAY_SIZE(conn), conn);
 		break;
+	case HDA_FIXUP_ACT_BUILD:
+		spec->gen.multiout.max_channels = 2;
+		spec->gen.pcm_rec[0]->stream[SNDRV_PCM_STREAM_PLAYBACK].channels_max = 2;
+		break;
 	}
 }
 
-- 
2.53.0

