Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C66A303CBD
	for <linux-sound@vger.kernel.org>; Mon,  3 Nov 2025 11:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762170580; cv=none; b=jKPcmT8UcWF/j+XhBfzj3BDYpOkcWuFCkVx7TxctZvHc/Qc9BtZ55mEhWtOjDrn+1eePmb/yv/tW4Gh/K0LAJL3Gr5GR69tvQBV8mxl6e5kXDAfxb9R8i/HPX+OyNqGXG9SXDhvKzvCEYPvZ9ogWeXbq3poAiIxTKvCKgSs185A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762170580; c=relaxed/simple;
	bh=APgdAknHqPJiWa2/QH7ZOODiVdGQ9E+OGnmmb+fe5p4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ouXt8ZY/ea3U59X22y40r1nWB0a0OYSn9047mJ0+DBWof3c5IBJUVT4Qw4gPqo826j3SOM0XEku5UAUg9J8DaSNOXg9dI32mHpQNxEXnWJZa3a8OKN+X/wx0JV1c2YLYnDTuaI+HPtsANI1skP46gb+37gCHx6WwwjDq0EuDeOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i+N8Z+OX; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i+N8Z+OX"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-63c0c9a408aso6267819a12.3
        for <linux-sound@vger.kernel.org>; Mon, 03 Nov 2025 03:49:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762170577; x=1762775377; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gkVl0Otg19KM1bBOhia1CJmMr0sGJOe4/Ogxs1Uyoq8=;
        b=i+N8Z+OXpe7vvdKcFAIsffQ4vnmp2Lmg91l5yKv+T4ohigKmclgFmx9E35B7MTFg0e
         jNPk8JmIOaNeqRsQWz57bXHoILj8+5arkz2bLQ24PgS3SZEwtM4zgKLLmYp0Vf1M6uTp
         1kUTmiWk6zANzCr1K7FOLgsOKgZlZmyQQ2R18TlTr04Jr+aKjf5DiB8DNYtqP42d6fd1
         pUQM7gBsJVN+PNTcGV7VVop7LNGwuSo1v1zU3er17RbvvbXUP5Jrfee9CNnAuyIfgyMW
         UX6BECQFpb5uCI/DiNzDMdU+MFDLoH3IYSnwMFjLoXS21wGqetGAD2LWSLRm+IJ24NWG
         Belw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762170577; x=1762775377;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gkVl0Otg19KM1bBOhia1CJmMr0sGJOe4/Ogxs1Uyoq8=;
        b=Ed5bO0MiNUJy62aCSlQ7cLLJqQpWd5iU4hzCBctvKool/O/gEEFrMYhpB6yawFNqsm
         SniQCnKu666x/XDplV4YrzuDy8A1GZ6x4kSoAp4fYqE8gnJsYOSFQfZ7y2snL0gOfFtG
         ZbqVcgj5ElEL3CsgnG6DKAuLERj1JjrKgFaxP7Cm9mJ/dH6i+AwvtCHu6I6c13L42+gl
         ezAH+AIo/hUoYj12O6njZak5EG+TVX2MGopkuXzBearpaeurYkVyIfiLidtDekVpjm3z
         z6nlNP9tMzZgwh14KaeOjMxusHaF5+YFtuutbFvkw5hONL1xYQcW4TvxEOOZhrsdGoyK
         TCpw==
X-Forwarded-Encrypted: i=1; AJvYcCVY4lHYpSqIPRtSpr4jYs8J7UtUlqBfqziPBOqQHIq4mcu6mZbI/vAn686WLHUUFUaEdA8zFx7jIoL91A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJuu2NAXHSIPE2+G/p9XXyuPXbKC/zxs1QqL4nG0msuJp5aHCT
	MtFN5JBjvEIQuG9ooXf4NqSLOvaosiYPl1DzHJ/ddiKemJ/whjNWbf1a
X-Gm-Gg: ASbGncttDmFyjrgCUK6RusYpypHAr147jUwcUrHFr9siIniRZdKE5DCrEF6g2J/BYgs
	0jw5egohSCxa9Ad5NeJUtDBCk0XWaNEOTnVHv1hZN4XjJWelnEPGqnTqgxYwA/MxjoA1WKBWCcJ
	ozFNMRlH1xlCF6vD0rTVWAX0he3PTNOMintuMsOptWJlKn/IkZ5/uuu/9lmxHXM1tndbwzpJKNj
	EN0arWABsMZsV1RXvwZaZ+dGoXjwF7cOYME0oAEV7L1XTcA87bDyJGdl1TwN9XEOf4YFYu/YpOS
	DVdpsgFgnHlFDzKc8UE/T+/eTDLHscg/xMSNy4GHeZ/UCTOe0TQSWkcti0d55Oex43bWNSk1Erh
	xtkAZzAsnIaYaHJb3Hm44CBdeCnbFeeQS1NHGKBDZAtWej4yzp1ZtPFeRREpDP6j5E6R+Awsiet
	3aOLQ8lNhfuFc3
X-Google-Smtp-Source: AGHT+IFXq9bnp96sEwFx/DuKX88NHdQtkXch/ktaCX6j8scT/NiJ960TzmMrnw3Erxfn9CX2FkXd0A==
X-Received: by 2002:a05:6402:440a:b0:640:b9c5:8c7b with SMTP id 4fb4d7f45d1cf-640b9c58d70mr3762816a12.15.1762170576462;
        Mon, 03 Nov 2025 03:49:36 -0800 (PST)
Received: from gmail.com ([147.161.143.87])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6407b438afasm9546138a12.30.2025.11.03.03.49.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 03:49:36 -0800 (PST)
From: hariconscious@gmail.com
To: perex@perex.cz,
	tiwai@suse.com
Cc: khalid@kernel.org,
	shuah@kernel.org,
	david.hunter.linux@gmail.com,
	mingo@kernel.org,
	tglx@linutronix.de,
	thorsten.blum@linux.dev,
	mengdewei@cqsoftware.com.cn,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HariKrishna Sagala <hariconscious@gmail.com>
Subject: [PATCH] ALSA: timer: Fix null dereference of 'timer->card' reported by smatch
Date: Mon,  3 Nov 2025 17:19:03 +0530
Message-ID: <20251103114902.11423-2-hariconscious@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: HariKrishna Sagala <hariconscious@gmail.com>

Fix null dereference in snd_timer_proc_read().

Smatch reported that  was previously assumed to be null
at line 1226, but later accessed without a check.
This could lead to a null pointer dereference under certain conditions.

Add a null check before accessing to ensure safe execution.

Signed-off-by: HariKrishna Sagala <hariconscious@gmail.com>
---
This patch addresses a null pointer dereference in snd_timer_proc_read()
by adding a proper check for timer->card.The issue was flagged by Smatch,
which noted that timer->card was previously assumed to be null at
line 1226 but accessed without validation.To ensure safe access, a
conditional check has been introduced before referencing timer->card.
The fix was verified by booting the kernel and performing audio playback
using ALSA commands. Additionally, the /proc/asound/timers
interface was inspected to confirm that timer information is
correctly populated and accessible without errors.
Note: Couldn't simulate a scenario where 'timer->card' is null and
'timer->card->shutdown' is 1 (shutdown initiated).

 sound/core/timer.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/core/timer.c b/sound/core/timer.c
index d9fff5c87613..d65e8bcb2f46 100644
--- a/sound/core/timer.c
+++ b/sound/core/timer.c
@@ -1231,10 +1231,11 @@ static void snd_timer_proc_read(struct snd_info_entry *entry,
 			break;
 		case SNDRV_TIMER_CLASS_CARD:
 			snd_iprintf(buffer, "C%i-%i: ",
-				    timer->card->number, timer->tmr_device);
+				    timer->card ? timer->card->number : -1, timer->tmr_device);
 			break;
 		case SNDRV_TIMER_CLASS_PCM:
-			snd_iprintf(buffer, "P%i-%i-%i: ", timer->card->number,
+			snd_iprintf(buffer, "P%i-%i-%i: ",
+				    timer->card ? timer->card->number : -1,
 				    timer->tmr_device, timer->tmr_subdevice);
 			break;
 		default:

base-commit: 6093a688a07da07808f0122f9aa2a3eed250d853
-- 
2.43.0

