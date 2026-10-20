Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792491528;
	b=vNp0/GmFsfR87n42IASkYvgmdIkdbb8kEo13SeTLn0Z6ChH5F+9PsvALCcjUxJf607Qg
	 OvikEnWK6R/jx/Kp/P0EhPFDmbcAZNwXuFossBJkVLYjpSc5SZ5/vjbCsrNZS7zdqdKY8
	 VEBLb944HPQwMFuEpkJHcAmS57Zjw3aZHIyvNX1ej6v9RTnAFHHSluizARXJ3hu/Q56AD
	 1nZFTs19UWLDRxSNVwB33kvJh/EfZjoeQJcvT/Bfb49rmzfeFPZBPtjDsqBlRjLmG0+Ax
	 OqtJVKOs7wKrdvJipXAR5ssyk7KXiMLf6h0dN/BFfogu1yhTBB4L2aJxOj577Gw8Tgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792491528;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=X2GCcH5pUMlDh8NZlJjZn+eXBw9+EHTk4lp7mOO+heY=;
	b=xZ48Gw+OsY+/688TpvFVG+LwAIdSk/8Y7JXsWKARDaVvrdezx6VVx1+JKrxhh3jd6v4g
	 WvZKDPmZuzhrNnaseWjB2NO5DBOTq4wXq/XXpwqOmwBKQFVLgCSKlnh8wRbzHl0g+s/MM
	 COJcobu2KHv0mKFO+iu8mLMSWlZn3U8eRlx55a7Ci2IRVpVB4p2viUifoCOCt61Y/lDMV
	 UVN9gywP+6HKW0CW5vRhv1Ufcv2yG9hHZVr2tw9+vlp807OXjaCkiRTrXX67+o16EdOyq
	 vLe11fE0oFjsBeTo/IXM5Hj8r2m/58VNMPgfXdi/2QKi54QgAsJj+m/hP8Bhr5WVJ4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=p3trgOPb;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B76B606A319
	for <linux-sound@vger.kernel.org>; Tue, 20 Oct 2026 10:18:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B76B606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=p3trgOPb
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3ac77270fbfso1796798a91.2
        for <linux-sound@vger.kernel.org>; Tue, 20 Oct 2026 03:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792491528; x=1793096328; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X2GCcH5pUMlDh8NZlJjZn+eXBw9+EHTk4lp7mOO+heY=;
        b=p3trgOPbamSlH2FX6sMX4Uk+/fGAXeeETd4TyWqfq+VnLK/VwB8r1znS5wyJ5609iO
         t3ehoco6VB/rKdXKCEwMmaTdasjbvmjUBwqIpUR1776N+PtAkVyTjTRxTw5QfuCYM6EN
         JJFtgvvPN3s2NwJeF899DzlenLBim1v/CzNMto0IZum8QhIwNP0O7Gf2a8ENfsnP1lTF
         mGQfncnOEvArhugKgF773QgTMsRhmqR1U7pDseY0yV3w73lObqCOw3HvdBBJkhF9QE3D
         4r40bSBstEbGd+DziyqW5RrGTaHLW2wote0/jDCQ7+gTmzOHTgZwJYUiX+poUL6T78/z
         siIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792491528; x=1793096328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=X2GCcH5pUMlDh8NZlJjZn+eXBw9+EHTk4lp7mOO+heY=;
        b=PwEFB/HcjjrmagrDN8ZpJnJQ3o3+vRc8DH82NV6DgalPoGDxorENEUVTGvbfy2Mk/I
         RAYDeRwiwvjuxFfcf3dTAqkPOewn1x7WYaE9waTByo9e8Jkri/IQOrLD6VFKPiTRKvAZ
         XQbOOJDcsfmxABEsj8+zhOtmhIi+JSOLjgb89udjMQqe+Oscc1OCLyHDEKe+0/P2kwwD
         yjhq8tKMRlfJ/4cbwkqXfKxIg/asHUO7T/MpQCrXmx3u5UWvRDO536sc6Ire6V3/v6I5
         m1dEsI7ctD09SIx7YWgpn1NpTMcFeliZf4aDP1fjWDxD8VN9RhvgfF3E16l68JtGYzRz
         lhOw==
X-Forwarded-Encrypted: i=1; AKwUvBxqNMiV+7bpspfXiVaK1iRO/k0oDohYLd94jScjTITs4MTVjEmxVbbFMAqbNAETqFzhhCFBlUbxqAb/9w==@vger.kernel.org
X-Gm-Message-State: AFq9FYJbTRIjl6cJ/VPVole0zN3Xxa3LwLe+gqImJNIcT8Y010K+8nDC
	++XmvlcB1lY5IWiNmjPNYD1LGljaWyg4kntua4a0swgZyGMIoQ4Wl/Fe
X-Gm-Gg: AYBFou0s5bQHETWm6rU+VE1S05VZCDfY3ME52hQUWheisXJe0SXbYbRRU8WfaFwo3Wx
	czq7bbs60fksTnvIfXGjgBOqucyXkbhcJEInDLLp1+o++uKO2XqsPn+moDP8RLW7TP7Mwmxcnaw
	x24SyqQeIq94IzjCFE1braB4FQicULlDRgcPufl27g+6lnZuZxvOCRcpt7zISdw+no3XfxkBVBF
	ObudJmfgsBpHexd3TxyYd/2uTIY6he/rFoSjOjizoBUUotACc0ipt+5MONunTUY21CWPDpuhs/J
	Zvwz63Dczhz8Wosz1sz3XIXI1i1l6wV/RZvUM8u0OB9fXbaKNQPdCMurZEhyBf9URt6Bu8wjW+s
	DOL6LXZ2i7JLc7EdChkkq6cAAaBb6QDOYNIZg59j2jW4CT4ssilV+J9n+IVobUITrfWYduhD8AF
	jqAmbVNT2N3voOIJoVu9CZSwzEQW5TRaiik4tChsQr9alQo6c0k2Y2lcwGjVgctT/4c6vj7rcN3
	1ThEo9t4y4gswI/o5lzheFaR04CHKtpfJcDjJDZs85JJA+VOYPSXkrUhwu2FJMNmE15TWd0rWE=
X-Received: by 2002:a17:90b:582d:b0:3ab:c674:d83c with SMTP id 98e67ed59e1d1-3acef13e7e2mr7913373a91.27.1792491527690;
        Tue, 20 Oct 2026 03:18:47 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad6100ba34sm2873904a91.16.2026.10.20.03.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 03:18:47 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: Takashi Iwai <tiwai@suse.com>
Cc: Ivan Orlov <ivan.orlov0322@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Shuah Khan <shuah@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: [PATCH 1/2] selftests: ALSA: pcmtest: Check the frame count of each transfer
Date: Tue, 20 Oct 2026 19:18:36 +0900
Message-ID: <6f16e2a01f18c0ea069164bab31999182ff6d49e.1792390197.git.sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1792390197.git.sammiee5311@gmail.com>
References: <cover.1792390197.git.sammiee5311@gmail.com>
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

The tests keep the result of snd_pcm_writei(), snd_pcm_readi() and
their non-interleaved forms in a size_t. A size_t is never negative, so
ASSERT_GE(res, 0) always passes.

The capture tests still catch a failed read when they compare the data.
But the playback tests do not. The driver sets pc_test to 1 when it saw
no corrupted data, and that is also true when it saw no data at all. So
a playback test passes even when every write fails.

Store the result as snd_pcm_sframes_t and check that the whole request
was transferred. The calls block, so a short count means an error.

Fixes: 10b98a4db11a ("selftests: ALSA: Add test for the 'pcmtest' driver")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 .../selftests/alsa/test-pcmtest-driver.c      | 21 +++++++++++--------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/tools/testing/selftests/alsa/test-pcmtest-driver.c b/tools/testing/selftests/alsa/test-pcmtest-driver.c
index 95065ef3b441..5bba17434a6b 100644
--- a/tools/testing/selftests/alsa/test-pcmtest-driver.c
+++ b/tools/testing/selftests/alsa/test-pcmtest-driver.c
@@ -166,7 +166,7 @@ FIXTURE_SETUP(pcmtest) {
 TEST_F(pcmtest, playback) {
 	snd_pcm_t *handle;
 	unsigned char *it;
-	size_t write_res;
+	snd_pcm_sframes_t write_res;
 	int test_results;
 	int i, cur_ch, pos_in_ch;
 	void *samples;
@@ -190,7 +190,7 @@ TEST_F(pcmtest, playback) {
 		it[i] = patterns[cur_ch].buf[pos_in_ch % patterns[cur_ch].len];
 	}
 	write_res = snd_pcm_writei(handle, samples, params->rate * params->time);
-	ASSERT_GE(write_res, 0);
+	ASSERT_EQ(write_res, params->rate * params->time);
 
 	snd_pcm_close(handle);
 	free(samples);
@@ -206,7 +206,7 @@ TEST_F(pcmtest, playback) {
 TEST_F(pcmtest, capture) {
 	snd_pcm_t *handle;
 	unsigned char *it;
-	size_t read_res;
+	snd_pcm_sframes_t read_res;
 	int i, cur_ch, pos_in_ch;
 	void *samples;
 	struct pcmtest_test_params *params = &self->params;
@@ -222,7 +222,7 @@ TEST_F(pcmtest, capture) {
 	snd_pcm_format_set_silence(params->format, samples,
 				   params->rate * params->channels * params->time);
 	read_res = snd_pcm_readi(handle, samples, params->rate * params->time);
-	ASSERT_GE(read_res, 0);
+	ASSERT_EQ(read_res, params->rate * params->time);
 	snd_pcm_close(handle);
 	it = (unsigned char *)samples;
 	for (i = 0; i < self->params.sec_buf_len * self->params.time; i++) {
@@ -239,7 +239,8 @@ TEST_F(pcmtest, ni_capture) {
 	snd_pcm_t *handle;
 	struct pcmtest_test_params params = self->params;
 	char **chan_samples;
-	size_t i, j, read_res;
+	snd_pcm_sframes_t read_res;
+	size_t i, j;
 
 	chan_samples = calloc(CH_NUM, sizeof(*chan_samples));
 	ASSERT_NE(chan_samples, NULL);
@@ -257,7 +258,7 @@ TEST_F(pcmtest, ni_capture) {
 
 	for (i = 0; i < 1; i++) {
 		read_res = snd_pcm_readn(handle, (void **)chan_samples, params.rate * params.time);
-		ASSERT_GE(read_res, 0);
+		ASSERT_EQ(read_res, params.rate * params.time);
 	}
 	snd_pcm_close(handle);
 
@@ -273,7 +274,8 @@ TEST_F(pcmtest, ni_playback) {
 	snd_pcm_t *handle;
 	struct pcmtest_test_params params = self->params;
 	char **chan_samples;
-	size_t i, j, read_res;
+	snd_pcm_sframes_t write_res;
+	size_t i, j;
 	int test_res;
 
 	chan_samples = calloc(CH_NUM, sizeof(*chan_samples));
@@ -294,8 +296,9 @@ TEST_F(pcmtest, ni_playback) {
 	}
 
 	for (i = 0; i < 1; i++) {
-		read_res = snd_pcm_writen(handle, (void **)chan_samples, params.rate * params.time);
-		ASSERT_GE(read_res, 0);
+		write_res = snd_pcm_writen(handle, (void **)chan_samples,
+					   params.rate * params.time);
+		ASSERT_EQ(write_res, params.rate * params.time);
 	}
 
 	snd_pcm_close(handle);
-- 
2.43.0

