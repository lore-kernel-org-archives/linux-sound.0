Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794798241;
	b=mtlpHiibEGzqarrMZLm4mmEERmXsA8tkM5q+3pKUBbPib9Aib7OFp7Sp0A/HUeNPUOIf
	 d+nquxeMer/ezxbxDkI7ptj+/OY1fymzAdGqFloxZOqHBObGskpw1fB1nf5X1emVn4Ftl
	 HWsSFFPOUuSDKMsHbaq+akUSEwK+iqMLP9gZBqHMLadEaVo7/ByMPlZSTBmWcLlgu3Zee
	 UWj4a3KkCIYjRJZw4WvT7RVolsxANhMEDp8wzPlRECQvzaua6kRZWLGFt5l9LzlZ0RpMb
	 si4AtErbqjtvBTgM3QTg25zY30TdqMwaq4McSuSeS+zGn0dRl2Pi080veFijwYGIq2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794798241;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tilAlplfK1rw0akhzzldbfcTxnq5HziwNFLGGQNriOc=;
	b=y5BMaf9jU9q5F/8WnDhcUS6dlv4t4Oj1NvdjV0E+aGDlKYhzbJMrx34V54sDBCe6ZVr4
	 TveQUHxup7hbms37ckUIIM3CBJA6HublxyA3yObxFn29UpHX8/ACK9XX7WlkcP+uUwW7F
	 Fgh8y+GkXb8UPJGSrAMGjLQnuTednasYaEQY8PDAp1kPZjFOBUz3VqYzOv6CHIgNRMKNU
	 DCLLwE7La8hlkj8CHS0FjqiekL8SKO/OBFJgC83/nYVayMJd38Zf3ql+kDpV+XWOX36Zx
	 mJY7I0Ry4/qhXjt4EFJKXmiWwC7ut97peZVuVqESqUBgzYGzpVHBBF1PlpnjuxYOLpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ybKS4G7a;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4AB606A885
	for <linux-sound@vger.kernel.org>; Mon, 16 Nov 2026 03:04:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B4AB606A885
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ybKS4G7a
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3282db206d3so8650102eec.0
        for <linux-sound@vger.kernel.org>; Sun, 15 Nov 2026 19:04:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794798239; x=1795403039; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tilAlplfK1rw0akhzzldbfcTxnq5HziwNFLGGQNriOc=;
        b=ybKS4G7akInIdfyuopW0i7MzNAHHhFJs0VsmC1NaI3dodJUHEUeD9GYw5jDoc+Y+2z
         bKKvyev8t+msX/NArlcSHiHRiup94Bi1hrRxuyVIkSvo+7Wonh5p74vBPp+lXf4d7LQW
         hShCDEQfRFUF1svOwlYaosXNmsH80bj5XZq6ahsAP6h588kapU+P0aR9tY7HIVpUTCgd
         4Ul9sfPta+4Yh7qS8ywSa9NKPMo3dNcLMvI4+qhstc9eqPUKqHcdSINel9sK/jBjIoNG
         yWebFEGEZjHkpDb1Yr7B+HqM6uMWF8u0qzt++bWztvlpSQHLd2gLXR69BpV+MgqIyrHI
         6M2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794798239; x=1795403039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tilAlplfK1rw0akhzzldbfcTxnq5HziwNFLGGQNriOc=;
        b=EqjM86MWrN/QL2GGK2atcrnfbCcjPVPwoF99aLnrIpTw7r1OOAGmQX9MG2uXvl1qHY
         n96Xlx0vZ9J/FV5eJyHc4gJKeGuWqO5CiGxMUB7Ce2KStohvUB/paEOXH5IUFlKqoloZ
         wvmrhPnwPIpbzumCrU0GKxDEaXLsyx2+qpPuPx4AWA9RnK2xwnKlnSpq4ev9zTC0+R4a
         Hv9yd6NctVpOeA4rO/WRISORxQAfId1W5/PsLpxfiENI/kg6nuoSBRG+ucAUx66ZDxBI
         XXjPMWwYT+1Ub80zGG5NibdJu1JIOtaF1e6dk3iTHbACX9jXASHFq0kuU2nbM/5x9ukC
         mPng==
X-Forwarded-Encrypted: i=1; AL+hErG0iUsdfCtrRRNxxXL6fMNv0u6L0bkDlIQZk6jpyK7cZOlJUcWlLucJG53oGSICpnlk4baqntWUhYeQ7Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z8wk6C1g/dbq2BhhzWqbCZIm95kqXjq16g9BzzajNsRNAbhOZ24
	lPQG3Zfl5uhQxq0pH9JWZ/I+PIxxP/T4ta4b31Y+9Zte+xVrezcsewlH
X-Gm-Gg: AYBFou1xVV2MIDGqLCg1lkmB+yqXl3wR7aysxwpQoOztyZQXcNHcgwAHyj5lFXsvn9F
	lGaaL8DsyoCj8PqPd4mhkhXUwjZCv9yAsjMH936NKvluffBXIYC4agkJfsQeWr56G+xeHrAjLev
	VAKtH863KcenpeLtzcZMq9RdfchwLwFVUDyD3GEKJGyR114jzwJepZdp6yK7EH8anZSajFmh5ud
	lGKIkOn2+d1M98RN3pxXkO1aO6yS8skP0yOBH02GtSNljAMZEma7L5aF7ldwJso5p7I6PNzj6ld
	rQaMHci07llIVB6vZFLT8DTym+E6wXkWXM6BWbfRTRFOYwCxlfGnhA3krQkUJCLCTYfcJKUvZUx
	LzcdK7C7h5GwUev0z84g3PQsit15WESxHXLXmqgPedsNT7hdQ3rqiMxxTIw57Zz3yHDS5Hrqp1i
	OtS9kE/xr19lONlZc0K5UrhI+8c7B0gMctUsnC8Zk8qPgZzc4jrhWPu4cTVrRQFlzoXRCWJSz+7
	TiAZifD43UgN92XPjy8ZYt8wiQzezqiCUpzG0baPQ75uAQnbYZazxFhzkSrnQsAQwIxDcNDZm+3
	bx3i9Dw9HCcLTHWuv3FUyFWn5pJSM03PCH14iC8vv68PkvbmUfBT5+LQeO1vvWZg7EICfYR6Zpy
	ZVtoYo7fnZNYsSZzRhsvlH9eM6371aa9GHb0TPI0PcQzAWcFajmhThyG3tBM5ag==
X-Received: by 2002:a05:7301:1284:b0:36a:1e0c:e28d with SMTP id 5a478bee46e88-3796395410dmr13036616eec.4.1794798239386;
        Sun, 15 Nov 2026 19:03:59 -0800 (PST)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379508762a5sm29195595eec.0.2026.11.15.19.03.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 19:03:58 -0800 (PST)
From: HyeongJun An <sammiee5311@gmail.com>
To: Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Mark Brown <broonie@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 2/4] ALSA: seq: ump: Convert a zero-velocity Note On to Note Off for MIDI 2.0
Date: Mon, 16 Nov 2026 12:03:35 +0900
Message-ID: <20261116030338.422671-3-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116030338.422671-1-sammiee5311@gmail.com>
References: <20261116030338.422671-1-sammiee5311@gmail.com>
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

When a UMP MIDI 1.0 client sends to a MIDI 2.0 client,
cvt_ump_midi1_to_midi2() passes a Note On with zero velocity as a MIDI
2.0 Note On with zero velocity. The MIDI 1.0 sender meant a Note Off,
but the MIDI 2.0 receiver gets a Note On.

The other MIDI 1.0 to MIDI 2.0 conversions send a Note Off here:
note_ev_to_ump_midi2() for legacy sequencer events, and
cvt_legacy_cmd_to_ump() in the UMP core. Do the same.

Fixes: e9e02819a98a ("ALSA: seq: Automatic conversion of UMP events")
Cc: stable@vger.kernel.org
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 sound/core/seq/seq_ump_convert.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/core/seq/seq_ump_convert.c b/sound/core/seq/seq_ump_convert.c
index c248d87f7a83..b35e3a50ec52 100644
--- a/sound/core/seq/seq_ump_convert.c
+++ b/sound/core/seq/seq_ump_convert.c
@@ -380,6 +380,10 @@ static int cvt_ump_midi1_to_midi2(struct snd_seq_client *dest,
 	switch (midi1->note.status) {
 	case UMP_MSG_STATUS_NOTE_ON:
 	case UMP_MSG_STATUS_NOTE_OFF:
+		/* MIDI 2.0 doesn't treat a note-on with 0 velocity as note-off */
+		if (midi1->note.status == UMP_MSG_STATUS_NOTE_ON &&
+		    !midi1->note.velocity)
+			midi2->note.status = UMP_MSG_STATUS_NOTE_OFF;
 		midi2->note.note = midi1->note.note;
 		midi2->note.velocity = upscale_7_to_16bit(midi1->note.velocity);
 		break;
-- 
2.43.0

