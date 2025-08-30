Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D24B1388
	for <linux-sound@vger.kernel.org>; Sat, 30 Aug 2025 00:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756512364; cv=none; b=G87tjTemO/v/7Ugw8uqzlAwN9xwP9gLQVEsGxsxdRtJlTWYD5/8ypid6lU/SBX9yWBUDGm+HpWarpdO9I2VqDyN6JsIg970dRCel5f4f2hHoM3N7MInFPWsa+ZvpdvbRwnWaSsYY38WZyJJbwS1jx6iWxbKPLlcMNZvX6VCFILc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756512364; c=relaxed/simple;
	bh=zoRQlWYjSRtrHtkuhENexsAuhMGRUA8iw9umQOgXtNU=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=RoZxs0YYbr8o/FlqpWNGbgsorV5UQUSBxAGKSjU+/9Jhm563hAfSrsqouR3OodMQIaXN3pPF15sX8zFuXaemOG0spLlDRbTEBmvYj9aD53cnMlQVGXxsdAL0uCQHDjribD7fBU73GmjW4w1lA4F+Wc/o1yWt4hyIeozUJzvKK64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3eefbb2da62so64495375ab.3
        for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 17:06:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756512362; x=1757117162;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zPwIJr83OOiOrOvJNnQwQo6sczvTMrs9wgSQP9HaOf8=;
        b=wkuBmyV8rIpW4FlkrVfxRlIw3AS/KpCEewFFf9D7SL2+s06TDW/qiZK+D31bwCyNaL
         mv9YgXgEqPG6HypMOycBwc2stUAEaY4vO13dOg5k2CnON7gOIL8ZwMBLOtWu+v1wCzIz
         S7OR9XL5F9SVrVvk/UbF0jJsoXdoJzenY+eGQNFTEh1t51w9C2VFoVQCOr3Dmx9rwaDr
         W8p+5YMrehGsSUiG6yqSz8hH1VhY3Eotu5E7W+ajd5wlyRAXHp1BS7ZZS5fzeqFf7voN
         5QB9LB8Y5/4necknHCfRON0jyNwPcr35QoJzXY023ngI9RD9G58hpPxaBPjAfoFAcwd8
         wYdQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9TLlVusid8XO9XUM1mDd+MH43zscKooifX5983yRvLYv2yjoPNXmutb/dNs8EhwOunF7QFpZX0VAKLg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxsHxPXF/M6ChLybAIhLva2+5fzvbYBKzwyqvfBzQZhLjoqNs8m
	+vcUVyPRlmalm6NgHGSAv/FzNJdrLgNMmwpJWbEjxa+SQNbu5Kgifq9RfuBcJbunUTE1iXo+3kd
	npmyc/6WaKJUobY9VQJ5Jg4w1n5rjs1tJkoj4+yhrWAdW/AMlELRFUaVO9u4=
X-Google-Smtp-Source: AGHT+IGS4MjUvuBUzFelAc/TkrLIxgjXujY8JD7wF/mNfz5vdBBd30lWZc1FTkcV7rNtn3W8GceodYn/Al4zbVxLFamU50La0eXs
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1fc5:b0:3f3:ee32:375c with SMTP id
 e9e14a558f8ab-3f3ffda8782mr10398005ab.2.1756512362698; Fri, 29 Aug 2025
 17:06:02 -0700 (PDT)
Date: Fri, 29 Aug 2025 17:06:02 -0700
In-Reply-To: <68b1f3ab.a70a0220.f8cc2.00f0.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68b2406a.a00a0220.1337b0.001e.GAE@google.com>
Subject: Re: [syzbot] [sound?] possible deadlock in __snd_pcm_lib_xfer (2)
From: syzbot <syzbot+10b4363fb0f46527f3f3@syzkaller.appspotmail.com>
To: bigeasy@linutronix.de, bp@alien8.de, dave.hansen@linux.intel.com, 
	hpa@zytor.com, linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	mingo@redhat.com, perex@perex.cz, syzkaller-bugs@googlegroups.com, 
	tglx@linutronix.de, tiwai@suse.com, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit d2d6422f8bd17c6bb205133e290625a564194496
Author: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Date:   Fri Sep 6 10:59:04 2024 +0000

    x86: Allow to enable PREEMPT_RT.

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=12db5634580000
start commit:   07d9df80082b Merge tag 'perf-tools-fixes-for-v6.17-2025-08..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=11db5634580000
console output: https://syzkaller.appspot.com/x/log.txt?x=16db5634580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e1e1566c7726877e
dashboard link: https://syzkaller.appspot.com/bug?extid=10b4363fb0f46527f3f3
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10307262580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17110242580000

Reported-by: syzbot+10b4363fb0f46527f3f3@syzkaller.appspotmail.com
Fixes: d2d6422f8bd1 ("x86: Allow to enable PREEMPT_RT.")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
