Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793888649;
	b=idvtQG/rgbWenrGJexHtIvAzrolqTHmeOSTK7MKU7iLD4cj0PuuX17tzBaQjJ1bAulkU
	 ph5GLLWix7XLNgeF/laOprB5G7ocRJ0YJ3U+YwbnSAwTHYLqAT64mSJ6Gqg5G/7y8V42h
	 QJNp6nVXh1xcmHg7LADq11HlfbfAtbu3yQQ19OqVF2E6xBLfg7/seHr+57urqe3zIwVYB
	 TFaDP/KA/3oJGaBPXRirHrOs6uWQJDDe6KGGwFNHZu1pAbWQFMQiXHyg4wO0XLSq4YKIK
	 IrWv1R6rFTS2Z+sJeHdcqLbVFHddMpjL04BCZmWnZZ6k4oOvY/De4davFiBB8iwc2Ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793888649;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8MyGH8Kh4awTUE2hmAlMJcE8YKJdI0+ELv+HH2AM0mY=;
	b=krLpf8FoJPXQEW//7UxMztmBOX1XQ3hARRp7vXfKPgXQZvZTb7wGDPaEzs9t0kZBhzwG
	 iJzrceL89fmzETP3RoLXyYpfCaaGw/E4WM9pIoMBZmfnkfVB94sE+Ixf6jSnzrvNPPnNF
	 7ylyzm9HW7ZO+4BL/l0iHLNtAepn9h1CtTGa6Qh1a/ZyBIhJP4YbrCYS+QKLT5amFFJpG
	 frq7X7HIo6VG2gTvHEUQ/OopmGJkpYM3eh5cAGC6IXN3PrXFNzJTySM+57KyE81p90wpp
	 8RQm7O7oY/UqqW85lXS0k739mMsSURkDMwsPUNw5IP+bC8Q/RWZlcoAiTBBY/GpG8sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MMZqZCI2;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C56606A333
	for <linux-sound@vger.kernel.org>; Thu,  5 Nov 2026 14:24:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0C56606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MMZqZCI2
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-14fc585291cso1909106c88.1
        for <linux-sound@vger.kernel.org>; Thu, 05 Nov 2026 06:24:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793888648; x=1794493448; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8MyGH8Kh4awTUE2hmAlMJcE8YKJdI0+ELv+HH2AM0mY=;
        b=MMZqZCI2+XZB18rQ5Yv0xm0/CYSqOF8/tfuWCCsIyX9yYuhtxMAnC6h+rYC4ZGx6Yj
         VpPV5mr92hWmJHk7pAuaUXcP5QRa9ti2NP0bLcnv5sIoYU4ttCLcIP7/GpOGqZUAIErp
         EomanEH0ztMt7eO8WSE6hTRbr8q2uCNH/vaAI9HtNUMfwRu48cXzTSI4Hdrw99uuSs86
         EhgSqfCxzRo5Ag0i8FBmt9axxZhkZfng3F8DQN/HQtnWNEDhsSRwVmq6yjEU6wLuzRud
         ekLj4tmR9p80W8QZnbNNNtiRzJv+LiwVixpAuhc852pIPNdAowhzJW5Rf9LVDOOkGkO0
         Ux2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793888648; x=1794493448;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8MyGH8Kh4awTUE2hmAlMJcE8YKJdI0+ELv+HH2AM0mY=;
        b=QSpqDn3+UZRj8RdAlSEKEv2Sql2RD5tO9S1R9OTCSG8i8Y9Vjh29qesbJpAcjmaQUz
         KtwU9kFEhZxjCX7cABMlAxAUtD47+OGkI5oUeyKu42hWtfXnQ4PLUUOMIsjbzDnsKKVW
         gwZfNoiklHxFtLHTd7i27wBv8cstg4WYAPRLlqHZTgLCq+oL4whAsWUWX9L7Hm5uc25l
         QR+vY7fVB3sZh3BdA2yJrsX91/GT11RuAfS3w2iB+fN6t0/Vg6CXapaES4xlsWMpxWDL
         p9yy65c1H+Qa5K5V+eC36irNrRPsdKVGhaTxAySRb1gCHaAvft1ZJDvh+cmhwEjHfpDI
         +gcQ==
X-Forwarded-Encrypted: i=1; AKwUvBxnjuorss4qyOL7o9CP7qaEYH2jPxz/x/HhU8bi9qBhS0Cu+h+9vBJIOpDX+ACPHu2++7VS7rdMqfdcjg==@vger.kernel.org
X-Gm-Message-State: APuU4Z81XMl2XWalKa6Wfxv3ekLtUyHmd6W+lpiRC5EGcxtYYqQ45vbR
	7c0lO6JA9DHInieLwLoOIQoCIDgXKOBEtYqvTDAGaS5CMpetlmJV5KZo
X-Gm-Gg: AYBFou0TRHefONYDl/uTi8XCj5GmzvSo39LE0iUnrWehRYr7yT4WZhREM6DarT+C13n
	pqLBCwxyd7MWj7bksNbIG57M+aPpuQTii7Z8pW84RuKrQqaFPBrAGc8AiWP6zEzp1uWWLTeOriU
	y9idrS0LIbAIfBjWFaR8CHN7rXH/yN7Qi4l9cHtJYRd6NMtGnuYVBkEeXlgBGbCm+bTZBYQ4sZX
	c7BXZO+27Gc5nWx3HNZ8LyM+cBh8pXB8+x1WuBBHSllLelq6EXpjjRSGlQuTVQ36j5crnRoO1nO
	BIIVUaMPC3PhYh7ih9GHkSpQEwmPYxqa0Ls7uTG8dD5+OwRniQxN4l7BKgRYg3LoHTGYNmmpmTg
	gm0Y6Xj2ZqgSgfvuoZsc/1ky4UzSOomCCXACjlRiCcPyVhFRhpJbWsi7Hs/NOqa3wbwNHBa2JQh
	SJaDNhWS4KneRH9Ciy7cvK47mkfssv6iYcXsFerCrJ9xISj5TX4E/OMJBW4oaCNpN+jtVcJkwQt
	wPkBSHWoClFD6hzNz2ljR1cppL3g73WdNDzDBVApqHE4+1WLMX28oxoixVnEJprIUIEx41J4PrD
	hZxt86RtXZmd66VrjnQ5JdwsKYPlZYrK1yx95OLgfCY90Z7xCxs=
X-Received: by 2002:a05:7022:f50c:b0:143:297c:276c with SMTP id a92af1059eb24-1aed79b3c1emr21779081c88.33.1793888628767;
        Thu, 05 Nov 2026 06:23:48 -0800 (PST)
Received: from localhost.localdomain ([103.178.205.85])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c748eesm16467801c88.23.2026.11.05.06.23.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 06:23:48 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com,
	tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Subject: [PATCH v2] ALSA: linear: Check frame count for all channels
Date: Thu,  5 Nov 2026 14:22:26 +0000
Message-ID: <20261105142226.3079-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

linear_transfer() checks the available frame count only for
the first destination channel.

Check the available frame count of all source and destination
channels before converting samples.

Use the smallest available frame count to make sure that
conversion does not read or write beyond the channel buffers.

Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
v2:
  Add missing mailing-list recipients

 sound/core/oss/linear.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/sound/core/oss/linear.c b/sound/core/oss/linear.c
index 6e51cfdca238..7765ac0ec400 100644
--- a/sound/core/oss/linear.c
+++ b/sound/core/oss/linear.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/time.h>
+#include <linux/minmax.h>
 #include <sound/core.h>
 #include <sound/pcm.h>
 #include "pcm_plugin.h"
@@ -75,6 +76,8 @@ static snd_pcm_sframes_t linear_transfer(struct snd_pcm_plugin *plugin,
 			       struct snd_pcm_plugin_channel *dst_channels,
 			       snd_pcm_uframes_t frames)
 {
+	unsigned int channel;
+
 	if (snd_BUG_ON(!plugin || !src_channels || !dst_channels))
 		return -ENXIO;
 	if (frames == 0)
@@ -92,8 +95,12 @@ static snd_pcm_sframes_t linear_transfer(struct snd_pcm_plugin *plugin,
 		}
 	}
 #endif
-	if (frames > dst_channels[0].frames)
-		frames = dst_channels[0].frames;
+	for (channel = 0; channel < plugin->src_format.channels; channel++) {
+		frames = min(frames, src_channels[channel].frames);
+
+		frames = min(frames, dst_channels[channel].frames);
+	}
+
 	convert(plugin, src_channels, dst_channels, frames);
 	return frames;
 }
-- 
2.55.0

