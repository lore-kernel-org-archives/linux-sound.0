Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793530869;
	b=n8CNtFUX8BZDl8OIug5WJPnsVmgkCVsTm9rIyP8QcLfJnSngAhUjICLOkQxNMWNkduSk
	 oeMgatNxJOBHkql2l+RoNVjgkKDssSxgIJtPF0bK2fUItok5xiPvmXm3F5gkeIw33I/Q6
	 6Gn9M3lsY2cz5cdHvWID/uAA/BPjNc85lCQ32XlRBXHRlW0dLiCKUGy0JeBFStTqkML6+
	 OgyVBg1YM8ZeSqHIh0JNHCTiXmVoUobg5L5m/8RIuJLB5a7pq9NCqIgGjwLoVVT8BXF3I
	 v5+CPgSBxOnQl5fT+PwUI1rTNzD9NETA4kwYJ07jn//kU2pOVjZJ+6VEpZqUTVIK5Zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793530869;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Z3jALjdrdXf3xBvYCdKRi8qu3dUZOroeGydfxdvXerg=;
	b=X2ZStM7+RvEPh0D7lCMJuDdArqLCHqA5NAFilm1uziJgv7izswbn/jS+fdyum88ZAjhS
	 Q7kmp40rEZpf+tSJR18MZNXr4+Tqfsg+K7/UmQNLmcTQhJLStiUbpdI+98+JFCf5+Zy+v
	 wrqH2UEbXO0wPupjwzgZf2/xr3aXeCnk5EaBVddXf1GAbotCCLbjWXU5kjNX/Iz6VVTWp
	 LSgbcxguk/IGTnf3AlYAV1Wni21CxsasE4uvrUdL+tyzQfrWJjIf7gTMR7gxJq8IG9KyE
	 lKxZd67s+5/PUxVIUYapKFwNBSIxL/4raZwZqUNeRqQgDoVrf9e9K1L8ukcXBjWrukg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="0kM/92WD";
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D789606A324
	for <linux-sound@vger.kernel.org>; Sun,  1 Nov 2026 11:01:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D789606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0kM/92WD
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48e10a70540so1169871f8f.1
        for <linux-sound@vger.kernel.org>; Sun, 01 Nov 2026 03:01:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793530867; x=1794135667; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z3jALjdrdXf3xBvYCdKRi8qu3dUZOroeGydfxdvXerg=;
        b=0kM/92WD0v4qpsaJw7S4K5e9zuMdCp0Vj+LZruauFSGvyndDbVUP5KQYyIZVrGTPIv
         00q8eRNcfsQJLSpA/KmWGZhN63jq4bpKorhOZ8h2yMX2OWrNgL91tjFre6EcA2Tin+vs
         pcNp6jS8m5J2VeDYvQwdfOCYwXcH9g1MER89tKBQQmApYK4pBfUzcmCr04DwmbK2Zrpv
         Lw+Qg1NsmFn3UZfYnZsbHoSxuZgVwrHgQzl+NjWbfMYnipcLbBtWuMHbakF4j/vuTZ7h
         RmLq940njobe2U3+tuZM72URAHwWQfcAg1qG2c84LFl2wK+djvrl40VTMYJE91IvQs+e
         yWaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793530867; x=1794135667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z3jALjdrdXf3xBvYCdKRi8qu3dUZOroeGydfxdvXerg=;
        b=Aiuhu7PX2k8bVGaB+eWUNKe50ZbRVVuna/ldC6KSqCiqWrF5UOLmwrGo3HsFF+lZ/D
         YaPddgbToRkKJdgHn3WK4XnTtrOjck/+LyK9ipGDeEDxLfwQcZOWTLqDehmi1vEn0HLz
         v3yZ1nimzyk/29hVtLEKwXz7yhqiqA9Lgp3p2TJdxLrYrHgaU0v7cZ8xdyySZ82U7z3S
         fHauqYIKHxJWPzqkOALQmdBus0RniPUchPiw5cNwEXwg3q/W1xVqvoVAo/GvmdrH0/kJ
         JA5S8TcDdBSJDsa4VwRd+z5XLvoTHKMLIe3vpb80xmtncMUlbBM2VhQ2PVMlGTUK1Fyi
         qzjA==
X-Forwarded-Encrypted: i=1; AKwUvBwzzfXsAmAX1AelkgPJo8aoxgZG6tG5hMH3lJVMsX6JQFLna6EpaWvG6fOr/zoz7/wIIuLyn/OiKh7EXQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+rMcNNe35C2k/EcCBDdGxXj3lAFSHP/kTcn6Z6cC/XzcTFCjEl
	Fm9XGlfL49MbGpMmj/WQghl7sBUM0VfZPllFSUVsvxlCFjv0RB2fIK5v
X-Gm-Gg: AYBFou25g7tGGWH7nRoXKJfze/WBoav7k6M1n2WhsZnOi6rKCS3wWs2JXYkrVLcWcNj
	vkQvUZgtj7OQDTCN9GwWzqrUDsjjfdaRtjJNRE1GG9vmYQtTutGk9CMXc88ppkw0D8ksRoZZMez
	ZoivzC+xYx67RvCcAwVR7JMSduEp+GDGlzvYw1tP5goI5PIyAUcu7j64Ig/9q8bLQ+pBTNDrXyT
	76GnyfAZrF4RWsrFmDOqDjYiJ3UjH7W3EDV+4Z4mZI428yusxfhdoJ7U393e/ZEKv++enAn0Ij+
	ZO7yy3sp64xrJ6IdMkygLY5hiPWVm+rTw7/BwcZZ1cHTBzwxBm+DLju4Bhmyw2l4Xdlhakjt372
	AR1dfvdt5wc1BDmK6uLnNeo8Oa8jWHERWz4qBHKkGch+SY1N8kZtYP3xdJXODv0P09QSPU3DGzN
	m6c2lXGB11+c5/ElOZp86vkdK9gmqEerD6gI6PHBAwLkzVCq7xZciafbtnWycILiwpRgUDHvi7I
	dcGn5m0rcU0F183PKCzpOmYNqnLIS9R7s1sAkRohLyKMBLrc718etx1SuG3B8m93bn+/1h9InuG
	54Pw+LMbJU5IMlxiwlRUpwTHmOz7zgUm5DDOoyCGTa1Tsg==
X-Received: by 2002:a05:6000:41c8:b0:48d:faa6:cedf with SMTP id ffacd0b85a97d-48e6e50645dmr15835410f8f.56.1793530867422;
        Sun, 01 Nov 2026 03:01:07 -0800 (PST)
Received: from localhost.localdomain ([2a06:c701:4773:6f00:1f0e:d397:58dc:8e89])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b78f95sm12388432f8f.28.2026.11.01.03.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 03:01:06 -0800 (PST)
From: Avi Weiss <thnkslprpt@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org
Subject: [PATCH v2 4/4] ASoC: rt722-sdca: handle HID button read errors
Date: Sun,  1 Nov 2026 13:01:00 +0200
Message-ID: <20261101110056.423353-8-thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261101110056.423353-5-thnkslprpt@gmail.com>
References: <20261101110056.423353-5-thnkslprpt@gmail.com>
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

rt722_sdca_button_detect() returns zero when a regmap read fails,
so the jack handler cannot distinguish the error from a valid
no-button result.

Return the original error and make the button result signed.
Skip button reporting on read failure, but still report jack
changes and clear button state when the headset is removed.

Fixes: 7f5d6036ca00 ("ASoC: rt722-sdca: Add RT722 SDCA driver")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
Changes in v2:
- report jack state on button read failures regardless of SDCA_0, preserving the original jack reporting behavior

 sound/soc/codecs/rt722-sdca.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/rt722-sdca.c b/sound/soc/codecs/rt722-sdca.c
index 1dad8012d904e..2d47420c0505b 100644
--- a/sound/soc/codecs/rt722-sdca.c
+++ b/sound/soc/codecs/rt722-sdca.c
@@ -95,10 +95,10 @@ static int rt722_sdca_btn_type(unsigned char *buffer)
 	return 0;
 }
 
-static unsigned int rt722_sdca_button_detect(struct rt722_sdca_priv *rt722)
+static int rt722_sdca_button_detect(struct rt722_sdca_priv *rt722)
 {
-	unsigned int btn_type = 0, offset, idx, val, owner;
-	int ret;
+	unsigned int offset, idx, val, owner;
+	int btn_type = 0, ret;
 	unsigned char buf[3];
 
 	/* get current UMP message owner */
@@ -106,7 +106,7 @@ static unsigned int rt722_sdca_button_detect(struct rt722_sdca_priv *rt722)
 		SDW_SDCA_CTL(FUNC_NUM_HID, RT722_SDCA_ENT_HID01,
 			RT722_SDCA_CTL_HIDTX_CURRENT_OWNER, 0), &owner);
 	if (ret < 0)
-		return 0;
+		return ret;
 
 	/* if owner is device then there is no button event from device */
 	if (owner == 1)
@@ -138,6 +138,9 @@ static unsigned int rt722_sdca_button_detect(struct rt722_sdca_priv *rt722)
 			SDW_SDCA_CTL(FUNC_NUM_HID, RT722_SDCA_ENT_HID01,
 				RT722_SDCA_CTL_HIDTX_CURRENT_OWNER, 0), 0x01);
 
+	if (ret < 0)
+		return ret;
+
 	return btn_type;
 }
 
@@ -207,6 +210,17 @@ static void rt722_sdca_jack_detect_handler(struct work_struct *work)
 	if (rt722->scp_sdca_stat2 & SDW_SCP_SDCA_INT_SDCA_8)
 		btn_type = rt722_sdca_button_detect(rt722);
 
+	if (btn_type < 0) {
+		unsigned int mask = SND_JACK_HEADSET;
+
+		if (rt722->jack_type != SND_JACK_HEADSET)
+			mask |= SND_JACK_BTN_0 | SND_JACK_BTN_1 |
+				SND_JACK_BTN_2 | SND_JACK_BTN_3;
+
+		snd_soc_jack_report(rt722->hs_jack, rt722->jack_type, mask);
+		return;
+	}
+
 	if (rt722->jack_type == 0)
 		btn_type = 0;
 
