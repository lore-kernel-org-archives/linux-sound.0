Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792667580;
	b=b4VLp17pBAPonxSVHZXWymmwNM9Uz9YP48pFCesg+/l6CuTgC0gNxERIcTYm/WMEooQP
	 kobwxciDgJuqy8J9VLix3ExD+PHo6olLmJ6cBkkAlwUM/zLhlvI5kJjTm2OTDOEDCmzKl
	 ytiNus2C75RzmEooiowXM2I67c9OezN52pY/DFJoovvA9+wYIJOJmm83b80Ei3NImtNVV
	 rNaMGr2RJ9O1msRxGGN2x8Xw22cwCFNF7jgRi7nfxFIRT2ZfcS58kK7hdiCaUhBXHuV1B
	 0oWeGkO7b42joSmLt8KE37R6DVdicButKemQ9b5OSA3r8ZpZxK2NckjD0SQ2NlsYeig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792667580;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=uhLtiQT7t6ajo473ebLicX49UUv+Dvbpjn9PDNkFvIY=;
	b=pLRAemt3IVQNUOQsUhzE+ld0GK5Ss0neHPoVh+zOAfF9GK8JrN3xiCEe2OoiLz73zEyD
	 MVwzQSbkudK0o31B9PWAfG6b8OTdimXAbYK3UOwjY5P94YxqeG0yc90lr4gDk1x6+TFdB
	 NsqVPfBbj8Q0HjzYaDkOuudhAKha8+LWWsy284r1s9Ebj4DJcg8Vy2SdTxBabkIEjnRPs
	 +l4QVtCZAjP21L79SU1lUkQup6LubaKL7RA34xjGb0CAAWR4jbFs5sjmdrFtOHHrXZixs
	 fQTfkJtJRI17aueG9SAtRqcNkKBZMRKa57YcdSaJ0h/lMAeHshABYpy2RS7Qx3qzxQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GVlifdhM;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D4AE606A31D
	for <linux-sound@vger.kernel.org>; Thu, 22 Oct 2026 11:12:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D4AE606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GVlifdhM
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso1366418eec.0
        for <linux-sound@vger.kernel.org>; Thu, 22 Oct 2026 04:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792667579; x=1793272379; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uhLtiQT7t6ajo473ebLicX49UUv+Dvbpjn9PDNkFvIY=;
        b=GVlifdhMD8peZksqyC6MnS7qD+0lfFkn24BKyxAmJI7BVH1EiCH6cO0jGnFHNGRWXX
         6UHoo9GYJnNNIYOjysaZOa3YZ2YK34NJ2BD6einTFyUg3t7iK7dqDH2UgzviMn3VR4k9
         rILnvDAmjRllXbgAIj8fMPvUa+mMWs3YSzY4YQ11kWHpBszPHDrzjoyNY+8kStoBi0nA
         5lM8860Mswqh2TDrmPZIMgkBgsHpw2GlR+mR3nf+fYKeXPaQOJZ4EThy+3V/CZo+Yea3
         6f5rYL4w1vQQTNdOiMCb3FisOqQsuWvSkgh4W/ag9VMCj2z2nyn4TFgFaY19zngFdWH5
         OHuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792667579; x=1793272379;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uhLtiQT7t6ajo473ebLicX49UUv+Dvbpjn9PDNkFvIY=;
        b=S0dyjjUHRPahg9skLOo7HCscC/rOBZ8owHat+TfUbP8ABlOz0xjoQYXLnMdvRjaGa2
         kH7kA+MpaIF1WFbvQq9tlAwPjXyHBltk1soKw5cnLPQxpa9GqObfegX5BSyQupIacS+q
         XHCCH7Utt6u/2vHQLLr8F4WWjtWfYQzsL2x7L+IJwp6AwdrzeiSpnO3myl6eOKJ4awNg
         tA4L+y1iIqbJv527j7O3Ewy3kQ2ojUs/bZ0oImJw2entcINjScXc4S9rQPaL76K96pSo
         hzO5/KE3CFNjY7LhUcLfGUofraeJzM+lOLxWOunXQTUg9iawrTwM3FTjjuU/XWKSfVWB
         7r0Q==
X-Forwarded-Encrypted: i=1; AKwUvByA8sYk/pixZRdMBhNOP2cAsglzseEcDtgSFFhRveQX4LcIo6Pi6mfTb/JPEAR8/N22h2KiKfh2cyDhpw==@vger.kernel.org
X-Gm-Message-State: AFq9FYKb2MM8g5Qx1acmLjSaBDYxOVQBqL6by8GK4CtByKLjoCQsNhiA
	FgujYcgeoxqTsXTDDJlQFPi6MGzq5UayysPB7LNS6u1Z2XsHUbkVmoU9
X-Gm-Gg: AYBFou17ENqZOWPSRLBqSSHLtQGFdAmEnD/Yc99xCNNI5BrLW8V1GBCJV3kBAimUZUd
	uWCQLeZNkysms9uPfMdY7MugsrXAl5n6Cgkcp9DjiviBBPeVuPNKldIWLNdjIfxropaDyke2vRC
	8EqCfuJ2HaXC2C+vKzDmu6xBg+umNj5p1okULWotPKc5EQpjim7MhSI2Q5jRA8j8/fiHXcUQ/9b
	xGKEZQuCzC3hA/AgTOXG5cb7J9duyuICrPtT/MEk1+0D5RuGDEk2zCSIG0vO7hC3T9bk/sq+iWu
	CIYOITdpx6cq8HwlOdnaCM7fadnqsxucf/b9JhfCSzBdCIW1C4eEA9JUnzjkCZ52dQO0YdekJYn
	Qo1AMzbADJDLETnZNMkB2V1M48jj2jYiHKUTWdecSqtR2sbEpwZFjY8gKfVtTcEMty8Phr7AA7x
	exuN9jTvrFvmWByoYO0WSnITED10TtQBU1Iwk3Lty0a/3Oav9T+uIcpuaXUwyViQ3P6H3Blku1v
	dCCk6LMUTmPj0kAEHgfnaU+SolOTH5NfGt5xzljphPobtv+2m2ipxljBV7ipXPXJbWjhPz5haHK
	iLzc9FM/NBkjy8EGBXNiMEdcu/B/SfNfRgWI+/tStinZFrKhl44GEJyDzuPUuqZlcSg=
X-Received: by 2002:a05:693c:414c:20b0:358:2e30:8e5 with SMTP id 5a478bee46e88-3674b62ecdbmr7545567eec.1.1792667578429;
        Thu, 22 Oct 2026 04:12:58 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-368ca914bb8sm6369653eec.5.2026.10.22.04.12.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 04:12:57 -0700 (PDT)
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
Subject: [PATCH 1/3] selftests: ALSA: pcmtest: Move the capture data check into a helper
Date: Thu, 22 Oct 2026 20:12:42 +0900
Message-ID: <2922e4e3021760ebed68b8e44b80fe0b2e3f1d9c.1792660433.git.sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1792660433.git.sammiee5311@gmail.com>
References: <cover.1792660433.git.sammiee5311@gmail.com>
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

The capture test checks the captured bytes against the patterns in an
inline loop. A pause test added later needs the same check, so move the
loop into find_capture_mismatch(). It returns the offset of the first
wrong byte, or -1 when all bytes match.

No functional change.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 .../selftests/alsa/test-pcmtest-driver.c      | 29 +++++++++++++------
 1 file changed, 20 insertions(+), 9 deletions(-)

diff --git a/tools/testing/selftests/alsa/test-pcmtest-driver.c b/tools/testing/selftests/alsa/test-pcmtest-driver.c
index 18ee72d5d4c9..fc4d12542808 100644
--- a/tools/testing/selftests/alsa/test-pcmtest-driver.c
+++ b/tools/testing/selftests/alsa/test-pcmtest-driver.c
@@ -82,6 +82,25 @@ static size_t get_sec_buf_len(unsigned int rate, unsigned long channels, snd_pcm
 	return rate * channels * snd_pcm_format_physical_width(format) / 8;
 }
 
+/*
+ * Check interleaved capture data against the patterns. Return the offset of the first wrong
+ * byte, or -1 if all bytes match.
+ */
+static long find_capture_mismatch(const unsigned char *it, struct pcmtest_test_params *params)
+{
+	size_t i, cur_ch, pos_in_ch;
+
+	for (i = 0; i < params->sec_buf_len * params->time; i++) {
+		cur_ch = (i / params->sample_size) % CH_NUM;
+		pos_in_ch = i / params->sample_size / CH_NUM * params->sample_size
+			    + (i % params->sample_size);
+		if (it[i] != patterns[cur_ch].buf[pos_in_ch % patterns[cur_ch].len])
+			return i;
+	}
+
+	return -1;
+}
+
 static int setup_handle(snd_pcm_t **handle, snd_pcm_sw_params_t *swparams,
 			snd_pcm_hw_params_t *hwparams, struct pcmtest_test_params *params,
 			int card, snd_pcm_stream_t stream)
@@ -207,9 +226,7 @@ TEST_F(pcmtest, playback) {
  */
 TEST_F(pcmtest, capture) {
 	snd_pcm_t *handle;
-	unsigned char *it;
 	snd_pcm_sframes_t read_res;
-	int i, cur_ch, pos_in_ch;
 	void *samples;
 	struct pcmtest_test_params *params = &self->params;
 
@@ -226,13 +243,7 @@ TEST_F(pcmtest, capture) {
 	read_res = snd_pcm_readi(handle, samples, params->rate * params->time);
 	ASSERT_EQ(read_res, params->rate * params->time);
 	snd_pcm_close(handle);
-	it = (unsigned char *)samples;
-	for (i = 0; i < self->params.sec_buf_len * self->params.time; i++) {
-		cur_ch = (i / params->sample_size) % CH_NUM;
-		pos_in_ch = i / params->sample_size / CH_NUM * params->sample_size
-			    + (i % params->sample_size);
-		ASSERT_EQ(it[i], patterns[cur_ch].buf[pos_in_ch % patterns[cur_ch].len]);
-	}
+	ASSERT_EQ(find_capture_mismatch(samples, params), -1);
 	free(samples);
 }
 
-- 
2.43.0

