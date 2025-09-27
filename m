Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA452D5A19
	for <linux-sound@vger.kernel.org>; Sat, 27 Sep 2025 14:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758983276; cv=none; b=ad9iv7YYmqKL0aKHHv4XC/v48/vaI6iy/W3zY559ZATrIDrblDOkmgTXOGZDt4G6t59K+l34QuOn0D7gKYZ2xuwJ422KKgQdtBuhyYEA1wr2q/DWaPme5P4zz5DMWBa+Z8eH7uVlg8Lki3cYZZMEAJc9LZtf9bRZ8qnC3PhSXwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758983276; c=relaxed/simple;
	bh=dyfLKoOKESXQGOBuEAWWF56KSFk/HfpZmrrRYSKThgQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ca+CNIduKBYJlxqVmL7yoV4uLG6NsTeDdtNN0uqcB9k6qiUTgv2lTRyPJVj0qYdnHA7L82lItMyx1GFFtBA3bJGlMq0FupefjsJX4DgZj1DJ7b7fp17+B24gIkZCexdpM/JE/J+nhgroi12RUltgvf7iXhMCvgMtIpFQQsK8GW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T5cJW5fc; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T5cJW5fc"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-77c1814ca1dso2534771b3a.2
        for <linux-sound@vger.kernel.org>; Sat, 27 Sep 2025 07:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758983273; x=1759588073; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZTfdu2+eJIkTaagdZ2RGB8x/LpZGQuTYGyFSVUpM1KU=;
        b=T5cJW5fc8UY5gGyuBYHbpAX1c+OpTSJxdrb8CvHEo2yETgPkf1zFRRTyb3mFErxHSL
         sE5AG7veuUyNTBKRKYD+qUzQMTzGkBCO0dAlBQzsGOgEJrn2AKE8Rd1KnoFOXriXW35Z
         gbBarvuAuKe33jzdwGNVlB3B1g8zJl5Tnth3Ud4c/zL5+e4yL3SJ9W/xeTi0DzbFgfNV
         vyATnv/G+c2bcd+TwjPmTSBhhy7xZEPo8HoqWtQ8ejM0JdOVevB3lwFCRL23yF5XHS7U
         qhh28eJNerC9TNyvWHUsInO/0+ukPWLT8GBFWxUevJk5PeQsJc278sCTx0U2U817X6RC
         WvTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758983273; x=1759588073;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZTfdu2+eJIkTaagdZ2RGB8x/LpZGQuTYGyFSVUpM1KU=;
        b=rWBRzguVOlJ6kOI7wjROj+/zXI0FGcOHvRd0Si/yZ+xBZ3AOJaYaTVBehNnhORrJtS
         HlOyFt9WliJpe3qlohySp1wpVeU9QIDk8Qtr6BqFuAayz+c9rmP4APshExTZqAfZ9B1a
         phPcmjYK8BGxnEtdeASWvHA6TvOc/RC2U8A3x4DnN6Y+LyDTngsqCTyZhK1pTn+P+lZi
         VE5WwRfbIAHaxfQ4vtYz3SWR9LdFoOiirY0mdmIwabfdNGdFrJc8FyHZZ2ncdx57wAeh
         gDFf/mG6sY0pKu8NLmsfXyjID2MNGETXise3LnUn0U8osmlHBKbH3yQ0UE5oXG7Iqb2K
         L5Og==
X-Gm-Message-State: AOJu0Yybf+MxrVZOtGuIF5IJyXCInRd5ion91KXAK4A7nL9Bd9msjvlL
	YlYd58bsE+Rl5DyANWc9nPeZBHmHnlWvdER5NJngOVVDNF32zAgkwnkv6eVqCkeYJG4=
X-Gm-Gg: ASbGncuiKnwkOAezxvL0cvg0a5RykZkjm1x8cvToVFC+KiC3zmKY8rWbnFfuL8p3bvx
	wQBA3AqdspEu9LQakaZBSA17d4ha6ezw645RsGBp3Ngy3twiFqtLQ85oqbB/u156vYC3n1Sw4fS
	tbY1s60L86uKQtgQ/+51XaMee02f3LUPY1BmhugTGFtM0m4Z7VoEP3UZ9C3yuq6c2bUBEZpf+ew
	Rt2sF57Y30b/MEUHe3h2iz4jHMUZMWU9QiRNcBDJSOiHJ4taIDO/5CeWiQg1iJmehKlCxbht9xz
	8cofnZ0UA4csGEbFFu8qRPPV14wvK1IVU6xmMmvZt+NYRzmqNsC8kqaiJXxNteREPLK0DGjQcHO
	0c+GgBZL7SCPI2fwDc1w647xmqb1yOx8Hqgon4f1SHzoVp1Pj1tGQUnDKdZqSMmLwmqfgwz7QgQ
	+2vZ/bdLEZ3dA+PEMrX65PRLOo5kA2xH8B/1PA
X-Google-Smtp-Source: AGHT+IHBP8XuwQgYURmKK2+h9LjcrKEDXnmVoUNMqIkUJdAbSAeUJqkk1fQ3Bu3iJRwAImHmhVb/Aw==
X-Received: by 2002:a05:6a00:2d20:b0:781:1784:6dad with SMTP id d2e1a72fcca58-78117846eeemr7207361b3a.24.1758983273056;
        Sat, 27 Sep 2025 07:27:53 -0700 (PDT)
Received: from crl-3.node2.local ([125.63.65.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78102c06b0dsm6730028b3a.82.2025.09.27.07.27.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Sep 2025 07:27:52 -0700 (PDT)
From: Kriish Sharma <kriish.sharma2006@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Alexey Klimov <alexey.klimov@linaro.org>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kriish Sharma <kriish.sharma2006@gmail.com>
Subject: [PATCH v2] ALSA: compress: document 'chan_map' member in snd_dec_opus
Date: Sat, 27 Sep 2025 14:27:08 +0000
Message-Id: <20250927142708.1097601-1-kriish.sharma2006@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When building kernel docs, the following warning appeared:

  WARNING: ./include/uapi/sound/compress_params.h:364
  struct member 'chan_map' not described in 'snd_dec_opus'

The inline struct 'snd_dec_opus_ch_map' inside 'snd_dec_opus' was not
properly documented. This patch documents the 'chan_map' member and its
fields (stream_count, coupled_count, channel_map), resolving the warning.

Fixes: 5d36370f3431 ("ALSA: compress: add raw opus codec define and opus decoder structs")
Suggested-by: Bagas Sanjaya <bagasdotme@gmail.com>
Signed-off-by: Kriish Sharma <kriish.sharma2006@gmail.com>

v2:
  - Use proper subject prefix ("ALSA: compress: ...")
  - Add Fixes tag for the commit that introduced snd_dec_opus
  - Add Suggested-by tag (Bagas Sanjaya)

---
 include/uapi/sound/compress_params.h | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/include/uapi/sound/compress_params.h b/include/uapi/sound/compress_params.h
index faf4fa911f7f..d7db6b4e1166 100644
--- a/include/uapi/sound/compress_params.h
+++ b/include/uapi/sound/compress_params.h
@@ -336,16 +336,14 @@ struct snd_dec_ape {
  * @mapping_family: Order and meaning of output channels. Only values 0 and 1
  * are expected; values 2..255 are not recommended for playback.
  *
- * Optional channel mapping table. Describes mapping of opus streams to decoded
- * channels.
- * @struct snd_dec_opus_ch_map
- *	@stream_count: Number of streams encoded in each Ogg packet.
- *	@coupled_count: Number of streams whose decoders are used for two
- *		channels.
- *	@channel_map: describes which decoded channel to be used for each one.
- *		See RFC doc for details.
- *		This supports only mapping families 0 and 1, therefore max
- *		number of channels is 8.
+ * @chan_map: Optional channel mapping table. Describes mapping of opus streams
+ *            to decoded channels. Fields:
+ * @chan_map.stream_count: Number of streams encoded in each Ogg packet.
+ * @chan_map.coupled_count: Number of streams whose decoders are used
+ *                          for two channels.
+ * @chan_map.channel_map: Which decoded channel to be used for each one.
+ *                        Supports only mapping families 0 and 1,
+ *                        max number of channels is 8.
  *
  * These options were extracted from RFC7845 Section 5.
  */
-- 
2.34.1

