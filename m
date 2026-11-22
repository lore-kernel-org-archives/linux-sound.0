Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795343788;
	b=Mk1jPCXodKLmrbSkkOjEweV+oHMNyj5ls9L4NQFzkwPiKbqyap4wjXvwwbOEtiwmLsEx
	 fw4MBrJRUranNoJBpQqw0dhazIuxLgh7rwc70eIozvhXsrPaS8yzpsgaFRuOD6CLwGWAO
	 Ns+FBpT/D7D88c4amVIMaEkIgsEmQtxEWS6XJnU6Cs+23jVFBU5crl0HPb1Ty2nkdy6CL
	 7kXizEfMBI6TEnXViMGAKpg5X/lsKiqDfjF8V6wPVGu1SWOaBZ9QNjxoHFptZCpiPXMPa
	 UiCmjqoCpHpBM3cprDW5x+k80tp3JW98IwkVmImgxLhaf7t3vq5V17jDLaTfemZ2+wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795343788;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/jvXQi6RIlt7Mtlnt0QbS4ARuJGb7qPHJ6+jlWg3p4k=;
	b=x5AHGi5OZZSdkUj3kIiRX9YATZXq8ATRhSmDRotOR929cs77tIqZZnj7LTav6bdUiCve
	 rJxgkrbUXSiyr46uTl9F71yWeDksQibfBfmhhpUU7OvvUUmW1UCbmttbshhKKa0Vtap4Q
	 BX2G260VZyr4UNzTptdkqgWOqPK4X0wD7XUu00PZFqX8maUaBlY70W8iWG4TGzMUbJgpB
	 OsxXWdluXz+oVXFxkyu7e/a4XuM/q61oT/tNrgN/SjCccwLsemSZjQ2QwXWPzA/bK7qrc
	 nxyKSb+Wlap58h7hkWFCI2x32yck9ovXT4mueFyPrpBAyr0xnmmBB5p401QbGW7wXCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OTrB9kG+;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95D4E606A337
	for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 10:36:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95D4E606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OTrB9kG+
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-380b40312e2so5475018eec.1
        for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 02:36:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795343787; x=1795948587; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/jvXQi6RIlt7Mtlnt0QbS4ARuJGb7qPHJ6+jlWg3p4k=;
        b=OTrB9kG+zDwFTQehuRLEAcN1WkieTn0pOHRiTB9/eh53c3uJmmO09751vH6i/+gOLu
         pgG7l2wyutG7jRl56gYC/AautEwNenET3+/Iapran3yZtODUegFhZG1V9/94yKeRr5FY
         Z4UqzyQ1JB+XAG/8SZByFJKP3WYfZx0dk0uWCqfuv7LYPyXnkVEY81BYhYsILQDZiuGt
         aB4Wwr4b0XCYkS+6oJ5rN0rhgLbtkHLCBODVy9bsmXvayQIsjdD5V3VJHNA1VCjMMCO4
         gYCFWQnb/bWBLN5VNuSdPgfqTQ8pC9kBnXx4gPoRiPbVFFVnx6F9ed8/bROlhoEeYlkm
         HNJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795343787; x=1795948587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/jvXQi6RIlt7Mtlnt0QbS4ARuJGb7qPHJ6+jlWg3p4k=;
        b=pmWdGEUwoDaQLkcUnj25NJkhCK5b7kZ+S0xrHQgcvYWbpoQIT83y0Vjy9yQ3WYJn7b
         8IRwax8GoHDSWeRyIWkxYU7FnZ/Bg5bEZid3j3DcVhP3LLZTqlKdMiUKwsmRyhfYq5jI
         JaWLefJGiccdbcmXzhanCsetQQZ3BWFhcXqgWyuAGZ61ES04VsW0/UOGhvGSeuRa6plP
         YecNrfP0q7yp8gH6B7Xa/RvWNReFIGfMVj2qGKZvZ/IQ19TPyl4Z0LJzOK7Owej5+NXu
         Uo0u6qapmvpA9hS93cEDKcZCxTZwF4WLCKLUIdi9VsFwWixM9B251iQG05jA7AE/CS9Z
         TAmQ==
X-Forwarded-Encrypted: i=1; AL+hErGPAbrm+11Myvtp0a5QCebMd6IY46LsB9hx2Tvpg5de/8mCrpYK7wiLg2ruD4+rVkvaBm/3ZMlVjlXABg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/+hQTrZ22qU34aNeCkQ7j1iUDzCLD0xFd8BAgVKk6XOpG+Y8rN
	Cl8wf5ZLmYT5h6jFQqxuHe6tBO9SzcZCh9Ecw077P5YHcj60xvISBqor
X-Gm-Gg: AZFdTZf69QORJfwu18EcLhsT7qiTV/IQpEumtnYzvoXm2wVFIvwKgrdFbXhzvO6aw+d
	EKp2Ax66gcZ+H+r6YIObKUEHaJY2GTDAWqEVm99RgqcwJIB2UP17m0nXZibimcBkGE0BU/BeJnh
	msnooxmdQXAOm97Gh70LWwg//952ecCmXONOb9ic5YUoot6/94WTZllWyLwfK2fPuBsrX9Dd1HK
	jNoChT/XrDWd9UquvAXW6EgKMzQadm08YCrJ/WFq0LR69qGcdUL7+lqmtx5PLHJ63Vf8MJm4TPh
	bt/81oeoKc2eKKcls+xtN1TJIF7bXkOw73WYCCASakL0EFrsLx/j1k2bLaloTZZ4NeukURmFO4i
	0cQM6lm4xSF9cQhw2nBjt22huolBb2cQ2Fezc4TQzxrsiYje7V2nKmx1rmWQ77lf49rZQ4XSMbu
	/rLRhpwbjKzNKkMGNslxbyBPhhqk5mTE64a38HU1hwj2RgjfkzRee33TKEQy0SOtX9r4bPcgwUN
	7GkL7nWglE8rXgfAFpNiqYIh0APG5brEJLIsEjKuodj5nDaDTLRkD7dT0ZpmTOSwgPcHxSFMbZS
	pDgKJP1G6LIcTedQT0UPyps8F8MZ04VYKLCiQimrZ8i85FUDKzGoT7HHXLNJKd5Q+HW4W0AsKRs
	WP3+2QzGYDaa4UuEHjgejI5jMkwdZfoF8jffIToZ/
X-Received: by 2002:a05:7300:bf27:b0:36d:3c0f:cc6f with SMTP id 5a478bee46e88-3856c9a7dd1mr10341532eec.3.1795343786729;
        Sun, 22 Nov 2026 02:36:26 -0800 (PST)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385667decc2sm26176803eec.9.2026.11.22.02.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 02:36:26 -0800 (PST)
From: HyeongJun An <sammiee5311@gmail.com>
To: Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Mark Brown <broonie@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: [PATCH 2/2] selftests/alsa: Test the sequencer UMP MIDI 2.0 RPN conversion
Date: Sun, 22 Nov 2026 19:36:11 +0900
Message-ID: <20261122103611.3264343-3-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261122103611.3264343-1-sammiee5311@gmail.com>
References: <20261122103611.3264343-1-sammiee5311@gmail.com>
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

Check that an RPN and an NRPN from a UMP MIDI 2.0 client reach a UMP
MIDI 1.0 client as the four CCs that select and set them. The NRPN data
has low bits set, so CC 38 is checked as well.

Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 tools/testing/selftests/alsa/seq-ump-test.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/tools/testing/selftests/alsa/seq-ump-test.c b/tools/testing/selftests/alsa/seq-ump-test.c
index 55bb7ea5b02f..7030d061dfae 100644
--- a/tools/testing/selftests/alsa/seq-ump-test.c
+++ b/tools/testing/selftests/alsa/seq-ump-test.c
@@ -620,4 +620,24 @@ TEST_F(seq_pair, ump_midi2_to_midi1_note)
 			  { 0x20913c01, 0 }, { 0x20813c00, 0 });
 }
 
+TEST_F(seq_pair, ump_midi2_to_midi1_rpn)
+{
+	int skip = 0;
+	int err;
+
+	err = open_pair(&self->dst, SNDRV_SEQ_CLIENT_UMP_MIDI_1_0,
+			&self->src, SNDRV_SEQ_CLIENT_UMP_MIDI_2_0, &skip);
+	if (skip)
+		SKIP(return, "UMP sequencer client unavailable: %s",
+		     strerror(-err));
+	ASSERT_EQ(0, err);
+
+	SEND_UMP(0x40210001, 0x80000000);
+	SEND_UMP(0x40310203, 0x12345678);
+	EXPECT_MT_PACKETS(2, { 0x20b16500, 0 }, { 0x20b16401, 0 },
+			  { 0x20b10640, 0 }, { 0x20b12600, 0 },
+			  { 0x20b16302, 0 }, { 0x20b16203, 0 },
+			  { 0x20b10609, 0 }, { 0x20b1260d, 0 });
+}
+
 TEST_HARNESS_MAIN
-- 
2.43.0

