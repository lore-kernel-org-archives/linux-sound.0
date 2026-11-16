Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794798236;
	b=MgTXRYgpyKUI9Rrn8KN4TI/ZnLy//434nR8kWXZdbo0Fmw/51qi2vaQMBJBhc8mQVNnF
	 //3+epcl48n6LodALOEDGVW2pmckBwpMcYzCPbHhOuZNxS4WyVsBFy8DzByvalx7KW4+/
	 6nA+KC+IJd2lVXhyrnYrchdZaYs8WgiJD28ipYaK/cfqNiqw3CqLKBx49IdG4VLt3bout
	 AxdFWUzium1zpvCYBSqE2LzARTSjNqTviDpzKOHzUIxgLQ9evdmMi0jKh61lPvlHcsZpO
	 62qnZVMxnPC2JszEnB9AEnxz0i3NkgczvM2tirGgQdUhEUSYuPUSIx+uFnfV1BYBVTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794798236;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=SNeaXfTa9XrrJcc3jd4rJaGJBMOoRygkUVLasRGgUSw=;
	b=SlbBmJcFBb7vSNmU37HGMISBy+gmD4KDKUWYx0HQD678vPWggUbk7NxVcPKvaKk1LtNg
	 DDAGamZh6mTJx11JbIRq0sjmbDa2z6NyhvYon5NV67If/IkhQ7mbEYXVoxSVUBqs0AfCg
	 7L/xdaKqSG9B26bqjU3N0Zka21dDW6mECbJzOU7s7GoN49B25QFlVQwMoIFbcYSOvCFHw
	 HViWwo1Ie2dZQ2p9KxNUXLSEpGUzsIFW2GtRJ8L0FeCY9JPTJeGB+vYznzKt9yShLLxju
	 IjIZsXM9Hd88PhNSvTLp8pTRkXWmgrm120iHhTrAxH5oQb7gLGrFT2MS9r+EzrBhNBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pe90he5M;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C86606A33B
	for <linux-sound@vger.kernel.org>; Mon, 16 Nov 2026 03:03:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16C86606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pe90he5M
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-37000e7234bso2179812eec.1
        for <linux-sound@vger.kernel.org>; Sun, 15 Nov 2026 19:03:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794798235; x=1795403035; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SNeaXfTa9XrrJcc3jd4rJaGJBMOoRygkUVLasRGgUSw=;
        b=pe90he5M91kANyHpOtEYXLVei3WC1v6hnxARz3LPWc+ngmX9flCf8dFGhzEps3ActE
         ufnm/3kO5npj5GS90QK74eqTir8h+5vpLwfA+cYlWN5uLa5R0Szpu38UXMVtYEaQ+WdE
         55gAdIgoEzNr/FrMY/Z9cyO57SveUqLkRJ0/3KowgS4NM3jZmMDfn99HjuvVldswJs9X
         /osx5NMwRPT6o87+Ng33GMT36pbHNouP450qaHTrO0L+vAyCgeMbdvOT9KEYnBEf30pc
         yi0Q6qGdGesBF1xABj+cp52ZrvUd4Z7cLNB9eb8TCfXgRXz/pfHPvYsFO8sG6ISfRG3E
         0tjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794798235; x=1795403035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SNeaXfTa9XrrJcc3jd4rJaGJBMOoRygkUVLasRGgUSw=;
        b=XxsJND1qMmW5IUMZ+8lnekzfb4y/vGc24KKVgRhctcYuZr1PuxN3moBYyrb0V6NArt
         uy7CRRX+eeObbBe2M0RtJBdZD4EuebTWtE7p1MupskKv4NEpxrKPe1R7XoM6dXhgmllA
         2hgJe46EPVPdhKjLN0coX7aT8y4YH6lJye/9WMdMbt4IshzLq2FQDcUyE3X2bqrbgCQO
         Gro6atfdDUGxJKmVrnA4reak47h6vJdnAi2CCLzbpK1zS/dVPyTmPRukJ2zJ9yPcJLL8
         2WHLipfZNYUQh6ysCPeG0SzgwakhFKQyRPOLpm7z/wc75yvqW0LgAbgHU699SkPSB9M4
         zifw==
X-Forwarded-Encrypted: i=1; AL+hErFbIQ2EcEuJbwirBSOZ2gtQGkj8KcUqAUqTAMJcx3KuNEmLUCSUGZCoOx4GJ82LaQ68BFvj1tSXoicxCA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+V66ueNDIPhJAUfaiQMjig73+zf0mG/k+lO++/t2gQORef1/Lx
	0JzlnvDHNDRPmIHkWSFXkFWng+Tgk2HddEfDJJ8yrjh+cKih8nH2SwDp
X-Gm-Gg: AYBFou25PdMGtC05n/Xg4GG0irhXnBU9l9UABIXeh03/vUVAWhBffw08M38IaaMGCw0
	aNoHlEeE0TsMhsrsXZUf8agnPX7fxDXli+escTIUSJQdhomiXTgyqjpUoU2/5MQtcGHC2qe7Bio
	i6ldMV6svp+ICJBuud8GqaSZr9gcQlc+VkmR01mWwrQa5C99WoRMiGj+2VPBxcj4xLN4pQY2nYa
	HITEbLL7DSARdj/rhk26NcIGGR0JAw7kKBq1KFAbEcD9BdxFO9OKxrbq0I93ZANMqxz8/4QH0jn
	uRS+vPaCcCWPQQgIfcK/QlAyrjjWulSHHMXBjuhNzbufbQNAQDFai2TAkZAnGkPh1aqHHyrw16Y
	lDemmq2Sg02Xxca82gBSzBTsEziYDRl1q+A/onixjYJvliLwIRroO0jUjrt9E2F6yWpnD+rU9Qu
	wS9jlLH1aH3e5c2piv1yIm7xtE81dqnOKcjU6UMK63dSnAnRLYUdWeEYX+jag+9KQwKoD7DdOqH
	uDV9gGgrzqoiaBtaCpOIc1JDzT9FDTDHbYDIGDcyz02LfJUPJztwVm0gVbPqbOulU2yv7GeI+yI
	rNL32MkGYfhIgUK2PSOs59ohxwxNl5uji0Rl+X3q4n0/6S4zsdRTucDSbYteQJx63bnYnVvcoOu
	vA3bOZs3vkC6rI3E1YkvyzUJ3GudPtFNSXZ7nuncd
X-Received: by 2002:a05:7301:db11:b0:369:fe4c:b48f with SMTP id 5a478bee46e88-3796047be6bmr8947853eec.0.1794798235185;
        Sun, 15 Nov 2026 19:03:55 -0800 (PST)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379508762a5sm29195595eec.0.2026.11.15.19.03.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 19:03:54 -0800 (PST)
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
Subject: [PATCH 1/4] ALSA: seq: ump: Don't turn a zero key pressure into a Note Off
Date: Mon, 16 Nov 2026 12:03:34 +0900
Message-ID: <20261116030338.422671-2-sammiee5311@gmail.com>
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

The conversion of legacy events to UMP MIDI 1.0 uses
note_ev_to_ump_midi1() for KEYPRESS events as well as for note events.
The function turns any event with zero velocity into a Note Off. So a
Polyphonic Key Pressure of 0 reaches a UMP MIDI 1.0 client as a Note Off
and ends the note.

Only a Note On with zero velocity means Note Off. To fix this, check the
status, too.
The conversion to MIDI 2.0 already sends a zero key pressure as it is.

Fixes: e9e02819a98a ("ALSA: seq: Automatic conversion of UMP events")
Cc: stable@vger.kernel.org
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 sound/core/seq/seq_ump_convert.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/seq/seq_ump_convert.c b/sound/core/seq/seq_ump_convert.c
index 62bdef6dca58..c248d87f7a83 100644
--- a/sound/core/seq/seq_ump_convert.c
+++ b/sound/core/seq/seq_ump_convert.c
@@ -630,7 +630,7 @@ static int note_ev_to_ump_midi1(const struct snd_seq_event *event,
 				union snd_ump_midi1_msg *data,
 				unsigned char status)
 {
-	if (!event->data.note.velocity)
+	if (status == UMP_MSG_STATUS_NOTE_ON && !event->data.note.velocity)
 		status = UMP_MSG_STATUS_NOTE_OFF;
 	data->note.status = status;
 	data->note.channel = event->data.note.channel & 0x0f;
-- 
2.43.0

