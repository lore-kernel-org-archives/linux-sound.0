Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794142081;
	b=SqhHzuj08F2XgTdeV1Hspe66wbyVk1ShXxv5m0f+t+wzFBrzT50V/uZDQGV9ppHCEJVV
	 DE+dS5Zyaa2kAbXffI9NyTDoRHxUJOuexgc1NhuoFpoHlwYkjGfxy6MGfJbrcreJtNodK
	 xckcVEYQpJWbjpTmFpR3vxWBANMv5cgO3fbgtkiKAvkbAKB9fqcUrdAHA6goKs/Rdn1bn
	 TA8q1Ax0LDaDbONoqjD2Y2/TWWwKKmfP05vce5IohEcHHHw6Irwk21ZLYdOpR/TJq5//d
	 TMwz9i18qc6TGChfOw8tbqnA202W2XtXmCL0le7qqapW1uD+yxvX8jLpFaf+DIDTL4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794142081;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=HALBGx9+QGwJF3ZwdYwT3GIkAgbteVKYnULFptYFeu0=;
	b=1Wik1quaJQFXaTepvarhPQw2oCqReUvt1F+IsE1FMgD13DcGyPwLm3gsk8PaFDLpghHJ
	 qCXqahgEqvpW/u0nWNdWrYpBgJQ7kh77s/jCyWfEvDTISQ3IwGC1slVWYf8+erQUq7y8c
	 zAOoV3uQlPk2/c309/xvHQhadthsl0txq2NXpBJ/j1rR/qPsVUkbUWMYlnpBXmgI/LyNH
	 ++ZLkg1uwcRUtlH2bwBut5w1UNRsAt4pl1vpJQjsaaF+0++eC8B884ihqlLHqazDuiwCM
	 BmMUFtlTGRtOSIqAt099dbIhW3gMrQxGCMFznx09hkvytrSaHd2W9ZiKB//5d63ZhsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FspUKeLM;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CBE3606A31C
	for <linux-sound@vger.kernel.org>; Sun,  8 Nov 2026 12:48:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CBE3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FspUKeLM
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-36dbde64409so140435eec.0
        for <linux-sound@vger.kernel.org>; Sun, 08 Nov 2026 04:48:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794142081; x=1794746881; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HALBGx9+QGwJF3ZwdYwT3GIkAgbteVKYnULFptYFeu0=;
        b=FspUKeLMakU+lwNFCrjm0VS3yCkD+doTRUQPyoLA3SDIDH5gErjoYFpK3HR4sSdZ3s
         shpwdH6K39Z2KVV3at+msv4dcgv+ku85JXDyjwl6lFDS/Cnpjw/6zDJlpiKa07KaNuUI
         w1gJ+fBKnyDtctO1pR9kKBQd5p67qPefABdSEDY/DkNXMHAIUqBAUKenPlVtjxZ3E1ha
         Il0tWWSsyOIcN0HjcBNWJNxMXgN/aDFGihBBpcDue1IDtHxhrVRGQjJs3cNLVtU6JKPh
         8+2Njt3Ez+Y4s66ZMvERmx67jkptfZAccf50+uvMu0EWbgojE4xr9W8UAEaRKqsPkfyo
         /GDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794142081; x=1794746881;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HALBGx9+QGwJF3ZwdYwT3GIkAgbteVKYnULFptYFeu0=;
        b=QoG5tbVQCnc8wjEqIi85lwG7tU/zz/SRvEFhthJNEEiir+XT/acYPMG2pbFjhEHaag
         C/gww3EdMaqVKqNUUAJqkiXwgvNNBYIRjkD/WquUj5fFCvykwuv0Q0BWnfcYrs8bHOkG
         I4u/I+OckMbr1LSNOE7bJ7MMJzWWDgRXyTZa4a0PJ9LkXFVA64AfcJt+lQRlXPzkdErx
         x3+Ka7ozvUv0MlcZ96wrQuNVWLoJUHQsLdRs/Xl1ArT1NsQa4g7ACfEXqMFH/1DO/PpX
         8i7JLeYhsnmX5TK01Diwj7OBpiVV8Xfv8Fs0wgoc0fkA1WFfhOfacR9qAudNhuMqhayW
         TObQ==
X-Forwarded-Encrypted: i=1; AL+hErHpSbnMeYTSW+JHQL1AmDUMUL5SEz558YmYmgjFn2rjXchoB5OWjicFYrSwwMS+cD9x8p7p8RhkmgN1Fw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8AC2KS0RsS6kDBabXRjVru9AQVTeehvRxQ4RGYSo4QrRXw/k6D
	yQZOqFPe81FRXmTgUjnyc7xQ4+rmVl2T5kyABuBqOvVIyMOw1ZR/k7Vy
X-Gm-Gg: AYBFou0U4yAEHtJiIymfq7m5isfZ8m42+byBUGmH8f/Il07wrqwyNK8Ejp0J4RhqYhg
	tDG7ewN28EbHboeFzhGrlwQzu9VwmiXEtua1Xf2qYSOR0zlFNwx2ZYKOcebDi0vX5GMfU/z0E3d
	g4ZeqTv3lszlSYbXIj6ABKR+ldr+bTrjMWFeEe4QPUQBqINBhINmTX8Zs098wjqIPdHegNZ+Unm
	s158wq9JbNXYsPsq27olmMZPF1Sm+waD4fv0scmq7KSa80Mj0jyvvS7eZQuN5T84DXmVtvlOgh3
	3kQCXPGPIJQMcUvpico41qpf7OtfEXLe9diHVgRUtza0p/rH6V1xXrlwZ/ikdYIJqjV5H1FAXxS
	PUb3r2345ABCL5rjPIndVOKPmW9HlEpHQxxBnCJzX0kosrRzRNZkOILvaQ8FHQX3MJt8ISA1Sfu
	lhHAU39GsFsL4no3IemqSL0vlVco+r9f3GFuzlZfjC/Ijz+z6MFAGX5X0upDzTLkpJr80j8n4CQ
	2eJOqnArZGAzSW3yv0RpMnLW1EhZNXv7UZdaVarSEdVDaNsNrFvy8sbf4fpE3jFUKq7uw+o/7jN
	pWAtehhHbJ79ub6WCuFKr+wkVGUE1ycdLvuMQ/lApxvW5Oik/cTybiMLJOPnQM9Lr3V0ZIilVYf
	4ui4MvAIk2A4SHD/KW+pZ1xO0/8XQ1is4oMyJW2A2
X-Received: by 2002:a05:693c:69d4:b0:36c:9fa4:dc5b with SMTP id 5a478bee46e88-3725807c474mr3078721eec.23.1794142079510;
        Sun, 08 Nov 2026 04:47:59 -0800 (PST)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37265619774sm5623975eec.8.2026.11.08.04.47.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 04:47:58 -0800 (PST)
From: HyeongJun An <sammiee5311@gmail.com>
To: Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Alyandra Zahran Nadhir <alyandra5b@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: [PATCH 0/4] ALSA: ump: Fix RPN/NRPN handling at MIDI 1.0 CC conversion
Date: Sun,  8 Nov 2026 21:47:47 +0900
Message-ID: <cover.1794141913.git.sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Hello Takashi,

As you asked in [1], this puts Alyandra's selector fix and my fixes for
the other RPN/NRPN cases into one series, for both the UMP core
converter and the sequencer.

Patches 1 and 2 are Alyandra's [2], without the KUnit test. Selecting
an RPN now clears the NRPN selection and vice versa. Patches 3 and 4
keep the selection after a send and clear only the data, drop data when
nothing is selected, and handle a Null NRPN like a Null RPN.

What a MIDI 2.0 receiver gets, before and after the series:

  Input                                    Before             After
  Null RPN, Data Entry, select RPN 0/1     RPN 0/0 = 0x40     nothing
  Data Entry, select RPN 0/1               RPN 0/0 = 0x40     nothing
  RPN 0/2 + data, data again, RPN 0/1      0/2, then 0/0      0/2, 0/2
  Null RPN, Data Entry, select NRPN 0/5    NRPN 0/0 = 0x40    nothing
  select RPN 0/0, NRPN 1/2 + data          RPN 0/0            NRPN 1/2
  Null NRPN, Data Entry                    NRPN 127/127       nothing
  select RPN 0/127, Null RPN, data         RPN 0/127          nothing
  RPN 0/1 + data, CC 38, select RPN 0/2    0/1, then 0/0      0/1, 0/1
  RPN 1/1 + data, RPN LSB 2, data          1/1, then 0/2      1/1, 1/2
  Null RPN, RPN MSB 5, data                RPN 5/0            RPN 5/127
  RPN 0/1 + data (unchanged)               RPN 0/1            RPN 0/1

The 0/127 row and the last two changes come from holding the RPN/NRPN
numbers, as a MIDI 1.0 receiver does.

I checked the core converter with a local KUnit test over 35 input
sequences. The 17 that changed are all of the kinds above, and the
others give the same packets as before. The sequencer side was run
with a legacy client sending CC and CONTROL14 events to a MIDI 2.0
client on a patched kernel under qemu. That test will become the
selftest, with Alyandra's cases added, as a separate patch.

Two cases are left as they were. A CC 6 alone waits for a CC 38 or
the next CC 98 to 101, so a second CC 6 replaces the first instead of
sending it. A CC 38 alone after a send waits the same way, and when
the next CC 98 to 101 flushes it, it still goes out with MSB 0, now
under the kept selection. Changing those would be a separate patch.

[1] https://lore.kernel.org/all/878q33y4z4.wl-tiwai@suse.de/
[2] https://lore.kernel.org/all/20261107111056.667-1-alyandra5b@gmail.com/

Prepared with Claude Code (Claude Opus 5.5). Tested on x86_64.

Best regards,
HyeongJun An

Alyandra Zahran Nadhir (2):
  ALSA: ump: Clear stale RPN selector on NRPN change
  ALSA: seq: ump: Clear stale selectors in sequencer conversion

HyeongJun An (2):
  ALSA: ump: Fix RPN/NRPN state handling at MIDI 1.0 CC conversion
  ALSA: seq: ump: Fix RPN/NRPN state handling at MIDI 1.0 CC conversion

 sound/core/seq/seq_ump_convert.c | 32 ++++++++++++++++++++++++++++----
 sound/core/ump_convert.c         | 28 ++++++++++++++++++++++++----
 2 files changed, 52 insertions(+), 8 deletions(-)

-- 
2.43.0

