Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794798244;
	b=C5fwp9RWiD348YUl2WdVgd9Y9mASwUJHM25+z9LHnWHPgj1NGR5nYwpcnO8Qvxa1wAjX
	 0+gjiSkqkxHOAi/qci1MssS1fjvo6F1oLW48mGgQg1hves2oFbwWOVyOmn7TFWokunR93
	 JUrjWFOdJ4U9hN6hc/d/CkD2M08IK9MQ0+gmG2Ymx8nvQ96ePFgA9r9RVcS2OcC/P1yCz
	 gqXghfffPflbneRfmvlrrzU0JW0g67LSUP3asv2nO6w/1MZxiKBbJGCZW4RBrNWIqMuwf
	 ZQs1C60QN7NMBNXXL2j/VtCt4bwazZfzZ0i2NcHi03q1mYa4bjkJLDY5/HvWBDvEksg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794798244;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RtxdEvx2VdJyPhemxlD9laLvznIE0xM53vHAefz3Wds=;
	b=5EfTyTJRQsKQMwPAdDShp+yLwhmuEu2TbCnwB80dwp/bP2Q5C2fXUCe+Fck2viYR54+R
	 ocSr6RTkSEDHbKXyBi1xyGhuk4K4bkKJ8h8733n+dcxyxHU9EBvXwUpWmciVWHQMUWo38
	 LDwoKX03LIzawrIzyyCoeJGATxAllXZ1SKKLq4tFc6w54hPRwf1ufa0yGSRf1zWsCpWmx
	 eCci/t4dimmoZ5znjLVI6rPsLANlDpDoCNRPJA7Ia0XTqKGAS55IfMJqjmWQ7bnVgOyA5
	 YUCUhXpNgQxMtgoug8hq/ic78kbPJnNEI/IKVCcet5GzF6sK1frV5mZf2IZYXSRps8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bzvDJNgg;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 119E9606A339
	for <linux-sound@vger.kernel.org>; Mon, 16 Nov 2026 03:04:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 119E9606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bzvDJNgg
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-36a315ed211so2841431eec.0
        for <linux-sound@vger.kernel.org>; Sun, 15 Nov 2026 19:04:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794798243; x=1795403043; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RtxdEvx2VdJyPhemxlD9laLvznIE0xM53vHAefz3Wds=;
        b=bzvDJNggqUoq0TyUa1hN7WNyA7Xjm2AA4kC2UrJ7yMrYB8dbmketv7XDbp95p336CF
         Y0HRuDTMJMUlQGYxnFRLuZzDz5ZD8J6nB4WiUeTqyeRe9EC6bd/1MHxxOv84ViTWC2Ao
         Bh6GxxOZIIvYWh5y7RuU3bNloKyB3ZHcpBTtXY0UEOiv/eFMYcPzgUqcWxWfVEqWAfS3
         txCzve78djzcTRd+Hr9clFzcb9X2HruJ42HaxKsNFn/eyzXkK0nSSyrPgijMKuHFK7/e
         UQOxf21Pvbt5qBHeXaK9VkncOoJ8LnCr45/amjLJHenTxeUtN27BQ0ANP1DxT4UW183Z
         /xEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794798243; x=1795403043;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RtxdEvx2VdJyPhemxlD9laLvznIE0xM53vHAefz3Wds=;
        b=v5cCnMoyQIAsv6mRn8P+PI9/6Is/g4L9FXnNXHJFLi5XZ07Dzgv24pxxjVBzAv84qF
         HIusNU0O6sbrNfPyooxiXWSpvqwOkvinyq87Gn36SDonn4wEtHozN+jfpf/qqrEAcQ5f
         8eGVfwE0B8TUwt+LMHgLK571FOMwfbzUjPPBIcvrr5Z6f5/C1GbSk1gIfkWZdN4CV3Nc
         ZHtdZ+fwFpILvBqktWipMuUcYZCyCZiDKrAmPcQqnJeO6zorw7JP5c4ZrU5brRwae1o/
         0JU81Y/xvHAhcJNVenDaEAOL6Z2w6OJgqJzvjCjOWG8vt0WlSbm/gEEt/91713mf3e9+
         dJ7Q==
X-Forwarded-Encrypted: i=1; AL+hErHAqvt68wzzI4e9AVxZ6+kur6QQbpdFQ6TNyTA5fWApMNxUkXadmMB4lQ70+lzILh7xxW3GoA+IMxPzWA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9hOqqOPIxwRUWFAVypBp23/JxmDuuTggVqcpbIgNwDwo4PK0tG
	5bFwGUGxBP6ONSZ6YMMPkZHpCiTg4tEFp2qjNW5hKb/LGBSD2/8T+RRW
X-Gm-Gg: AYBFou0oeqCB/1eGNQmJhHXpNG2TYfBo3vaeLQzE9VuL7xClQftfF614cGFZagQw11r
	Ld0OijXqTyowb49Sm7UbQSZLRYgmS5eBIuh8Xyeom8eREwyRZNHLdMVvp3PqT+ot91+VZXk22WO
	tFKQ3np1VJpp7slNV26+upaxcsrdgVPzvm8jr0GvxZsu7OOXCcObT8DMyd2aptrIDguD75TTcmT
	NB+BcEqivr3EUwPf1d3e2uWhEeV/7lCcZFTI7nGUsZAfveema/HXUeVAov8cL4bykIi1r2CvKZi
	TLXsoC2Ox91Fus6KtOuZNPgRsVHQFfHegzh4FlZrPLWx4+BodlBeWgYDaYArj7bacb69eLuGGAC
	kcCOXOBe+uUfyrTK3syHJ2CPIL9JDqmF6ML8rABNXR/0xDeRq7NomvaIerj0LxnVSaiysubdrt/
	/Yqgl+I/tspbZo9mAOb4N+Oal1r4GhcZoXmg5OxW4s41hD6U25o/my3HX8+Gl/oUWCYmGGd/AQ8
	nsi/TTOd1kpwh2t8utrTpz7qkDIvb8fgboCgZvzFMwksk1UqVCx2T7njBS6K8RIbi0XoLtodS+/
	NeWJLY1g2Pyn8vqblpYB3vWQmYY0YuX2/fAxPEp5PG08VdBhjTyl2yh/DiqXgwplAntms7nhYpS
	o3zOPtN5GxZbrns++1EnQhSWF3Hn8U8JTEVs4QWzANn8=
X-Received: by 2002:a05:7300:7fa6:b0:36d:38e0:79f3 with SMTP id 5a478bee46e88-377e1af812emr17694637eec.25.1794798243051;
        Sun, 15 Nov 2026 19:04:03 -0800 (PST)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379508762a5sm29195595eec.0.2026.11.15.19.04.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 19:04:02 -0800 (PST)
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
Subject: [PATCH 3/4] ALSA: seq: ump: Keep a soft MIDI 2.0 Note On from becoming a Note Off
Date: Mon, 16 Nov 2026 12:03:36 +0900
Message-ID: <20261116030338.422671-4-sammiee5311@gmail.com>
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

The cvt_ump_midi2_to_midi1() scales the 16-bit MIDI 2.0 velocity down to
7 bits. A Note On with a velocity below 0x200 becomes a MIDI 1.0 Note On
with zero velocity, which a MIDI 1.0 receiver takes as a Note Off.

Send velocity 1 then, as ump_midi2_to_note_ev() does for legacy
clients and cvt_ump_midi2_to_legacy() does in the UMP core.

Fixes: e9e02819a98a ("ALSA: seq: Automatic conversion of UMP events")
Cc: stable@vger.kernel.org
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 sound/core/seq/seq_ump_convert.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/core/seq/seq_ump_convert.c b/sound/core/seq/seq_ump_convert.c
index b35e3a50ec52..b42a7ffbf31e 100644
--- a/sound/core/seq/seq_ump_convert.c
+++ b/sound/core/seq/seq_ump_convert.c
@@ -457,6 +457,10 @@ static int cvt_ump_midi2_to_midi1(struct snd_seq_client *dest,
 	case UMP_MSG_STATUS_NOTE_OFF:
 		midi1->note.note = midi2->note.note;
 		midi1->note.velocity = downscale_16_to_7bit(midi2->note.velocity);
+		/* a note-on with 0 velocity would be a note-off in MIDI 1.0 */
+		if (midi2->note.status == UMP_MSG_STATUS_NOTE_ON &&
+		    !midi1->note.velocity)
+			midi1->note.velocity = 1;
 		break;
 	case UMP_MSG_STATUS_POLY_PRESSURE:
 		midi1->paf.note = midi2->paf.note;
-- 
2.43.0

