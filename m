Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 574333FE37C
	for <linux-sound@vger.kernel.org>; Tue, 24 Mar 2026 17:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774373915; cv=none; b=bIHLi/9y7sb7NSa9eCGTfL/1Oa7+79CxUx8dB1DSu72sbILuORk9E8/qoTCxzXFrN49VN5ajJ/EaW96mp4xqAsU8PQD/4gRwH0K2HQUgqFIbAH9PVlnqbbSALMzEXoOk1D+7XKyXTIs3xpKmrFpdGWXB/V0UZWZfYyUazvil/44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774373915; c=relaxed/simple;
	bh=VbYIDIazuAKliHd4gaVoOEnfMt94rZKAwng2qMST6KY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Hpb/xBbIm6QnB9Lrrs3LiSlJoqy68B6IU7uS0zLUsqldwanNHDMRTyJPRXX1DA0DT7j21Q8LHtl9gc8GPcWP9TiW5kVzrNIqi6ROQJekB2RT1KgG9VVSIsYYqOaCqDPj2fwpeuC8/rc+WpNzeMyQkW76wBWNIXBouJjGUp0t/2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oSxO9AoB; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oSxO9AoB"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-79ac94fc3ffso9167737b3.2
        for <linux-sound@vger.kernel.org>; Tue, 24 Mar 2026 10:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774373913; x=1774978713; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Zhk7eb8OjjvNFySWuiOYIrFwWI2N+A/k+Z8JkVgJz4g=;
        b=oSxO9AoBNU+CUrWJR37HeNz9pJsuG3erxVGYuN0vuMxhtxq+nH16YJsjZ86twS4NJO
         c8c2f3o0JOFc19rSeNt9lJj+1JLHAD1coucfoj/nTClFlD5xQ2VrigcHno2H6iX1xYeP
         0Rso8rsRxdhQhXBo8tb/t1TfS3tgguCdYhLP203FmsjZYmRi24wCyNp/fxYxOo9ovYvl
         iIMzwKSexHUIGaGEh3MJEHHHDClhONQcHgMHMUFN8pjKcDpMKHnYksxC2+GYYcJBu2Td
         irrGYThf6vUeJKp5CP34Act/KEzBJDXWzm1Vezw+Cbk+USdu7hupjCC9es3o6ycmfP5I
         lqIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774373913; x=1774978713;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zhk7eb8OjjvNFySWuiOYIrFwWI2N+A/k+Z8JkVgJz4g=;
        b=reIQEfzTFl4UlKZ9+OV1/1l7UN+NnhNQ8BlKMe50q8UPSfIrVKMK7ZyRZ73SsCNgj6
         2vLttdvwlDqP6ht1g/3APCFJgyQecwSDhqC34AXN+OUEjs57TtCwhXGP8OxUfWq+Qli5
         gF6KyA0ZjAeTCznyE/NkvNaXjWcyf9/tmNiFUuFgAoC4BIfna92D/WucjARR2eqxTKX5
         uo7hbe9uqnOou+J/zxPUnoAJiaezoA1GNOPJ0QkuP9LiTRRZygJ8K1y9onRrr32v6Eoy
         btXhreqblTxoQKyJ+D4LONtrbIm65FGvC2tOu0XCqjdhnmucsUXeknpyA3HBghNw9cxu
         5nXw==
X-Forwarded-Encrypted: i=1; AJvYcCUJ7NnkUFiQOrdTP8NSfUVIF1XuLxpCp6a8lyVA0/My2ERifU7r440b33fYtW8ZdjXW4+sFXrixcyocFA==@vger.kernel.org
X-Gm-Message-State: AOJu0YytjzZilbH1tR1lA2jqh4MqqAUFSg53ud3SjzadW1ikV8E6KGAg
	o45gpUCv8IUrmRgYlmcWzfsynROw96DbidoVMqgOHzDjCFvC9A0IPga0
X-Gm-Gg: ATEYQzx9amjpfvNH0aX+mCvPsDjFbHWr5OPl/sGhRB5BRw3cxlExRA/NLXQhn6YYYE5
	dx1zyscGbyoqYBQWnqVBlQCBGXER30WyskGIyHSU0dQPMGXdbHmD6oglDAVPZxRC5fCtiu6KIgz
	6LOklOR8Q2j8d4ZuM0qM123VqbYherd3xhlNwDYMEriP/MCW3bRkTmeFoCijnWm0+stRBeE2jS3
	rfHdsrJ0CUc/KSjyyFGTZ8VNL+h1fyvE0xTlDJXqs/I8QY8WcBkmIQI5bLKjibrYxfWuYyAXVUJ
	Wk5MOp4NwX8/XyRxTH0DmrM+shxyjc+czu9v0tzzVNFWVL1xOMBzF5AYlx9C+DnEO+DLQSJJBIX
	3RsgTkQSgkW6JZafobBkPf3qCOaMRUbcd94fju5+lRlPMVK+vSvttRZdecV7mlMrmDecTL805FJ
	BWjXsrXB/sjzc2mmXjTUd286+8kWAVHfFxfVjRDw7kMiVygJwg5tAJM6CFIlG8eD5K777Wy4uPa
	ynKlu3Z8aNfyjxCWlbn/hbRxwKeBRn+ie0=
X-Received: by 2002:a05:690c:9988:b0:79a:c7f8:d98c with SMTP id 00721157ae682-79acf614bccmr6487657b3.38.1774373913333;
        Tue, 24 Mar 2026 10:38:33 -0700 (PDT)
Received: from tux ([2601:7c0:c37e:2360::17e2])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79a903a6e9asm74563487b3.10.2026.03.24.10.38.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 10:38:32 -0700 (PDT)
From: Ethan Tidmore <ethantidmore06@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Colin Ian King <colin.i.king@gmail.com>,
	Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
	sound-open-firmware@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ethan Tidmore <ethantidmore06@gmail.com>
Subject: [PATCH] ASoC: SOF: Intel: hda: Place check before dereference
Date: Tue, 24 Mar 2026 12:38:30 -0500
Message-ID: <20260324173830.17563-1-ethantidmore06@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The struct hext_stream is dereferenced before it is checked for NULL.
Although it can never be NULL due to a check prior to
hda_dsp_iccmax_stream_hw_params() being called, this change clears any
confusion regarding hext_stream possibly being NULL.

Check hext_stream for NULL and then assign its members.

Detected by Smatch:
sound/soc/sof/intel/hda-stream.c:488 hda_dsp_iccmax_stream_hw_params() warn:
variable dereferenced before check 'hext_stream' (see line 486)

Fixes: aca961f196e5d ("ASoC: SOF: Intel: hda: Add helper function to program ICCMAX stream")
Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>
---
 sound/soc/sof/intel/hda-stream.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/intel/hda-stream.c b/sound/soc/sof/intel/hda-stream.c
index 1c04b5d9c0d8..5c1f3b427cdb 100644
--- a/sound/soc/sof/intel/hda-stream.c
+++ b/sound/soc/sof/intel/hda-stream.c
@@ -480,16 +480,20 @@ int hda_dsp_iccmax_stream_hw_params(struct snd_sof_dev *sdev, struct hdac_ext_st
 				    struct snd_dma_buffer *dmab,
 				    struct snd_pcm_hw_params *params)
 {
-	struct hdac_stream *hstream = &hext_stream->hstream;
-	int sd_offset = SOF_STREAM_SD_OFFSET(hstream);
+	struct hdac_stream *hstream;
+	int sd_offset;
 	int ret;
-	u32 mask = 0x1 << hstream->index;
+	u32 mask;
 
 	if (!hext_stream) {
 		dev_err(sdev->dev, "error: no stream available\n");
 		return -ENODEV;
 	}
 
+	hstream = &hext_stream->hstream;
+	sd_offset = SOF_STREAM_SD_OFFSET(hstream);
+	mask = 0x1 << hstream->index;
+
 	if (!dmab) {
 		dev_err(sdev->dev, "error: no dma buffer allocated!\n");
 		return -ENODEV;
-- 
2.53.0

