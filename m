Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D1F1B4141
	for <linux-sound@vger.kernel.org>; Sun, 14 Sep 2025 10:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757847066; cv=none; b=UiFlZbGvW3qP8A+Xc2C4kwMbvP0hgrksZP4rzfZrxUAMFmq4kN2CGBK6hLMd8HBKOQJN6ze3PiHbN2K1BiIkxUhDiEtSarxxGjM3ULz7UKLCeOK1SwbHOFGuxSwWwxU7FlF2BnFSUVKmJaSk9H+7MqH/9I91UKyKwNo2xoTwIc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757847066; c=relaxed/simple;
	bh=ua5Vb5zOeYFg3FVg3bHIT2DYfrWRx2dMA6ntfB7TQUU=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=HX5oSOFq1h4o57tdY8tWXswX1ZRT1Ur0U4AmTsOgPQgK+CR2zQyH/VVBbmgUmx3Q2Cfnix7Vf5d5fHI/hl7FOeDjeUNZ9JV75/9iE8V7Lej8aLf2Etoq3CsrMVt+q0n2vfhIscfLpJkQrK16SrBhhTJ3GOGuWjjZA0HbabORkZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3ee1d164774so61147285ab.1
        for <linux-sound@vger.kernel.org>; Sun, 14 Sep 2025 03:51:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757847064; x=1758451864;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1G99QjZJIxqZZW0DGsDJGiZk1djjVFhimNBcqrYyh24=;
        b=wzv3vql2RpkbZvMTR4ej0m8fQ2KSyl0LEAyxPFZc3xET4duLMfmdGaOmLT2qsBLMnk
         scmno7d5V5iQKukqSyzcv+ndLeBvzL62GzE1ciSzpWx0etfJFyeDGKCXQzzIHQe6kr6v
         qZN8aSvzX/COc6W6iBsIMQuSjoDQCH6dtq7SVXkXATDRS0Lo+vOVIlHl6GzlFnHQ/1w4
         yV9SdIA60GATG+gmvfbEKuk0yUQncKoJY0o9snQwjK5Efen3lbCtk93DdriG2L1MhQwM
         WNIgTAbyBr1y0UKC/TZ73DdMcRCKANtZ2ikgPf4SsjYwS3fJ9axdg6giR8qfrn62IVgB
         2jqA==
X-Forwarded-Encrypted: i=1; AJvYcCUZdWC7uEQ5ry65XwBIi0mOTIBI+QYrEo6gZDOiyy8efKqIrZu14QietpWXPZ25Wz82USB3LiFy3J5Aaw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6NP36Kd6VQndR2HBw6NuJTFxI3awP5VGmrPIniTAEaKbrOEA8
	BkIQsJ7WLDTXEnbKedPwkm0H9/4OI3TffJKR4E5hOkhzYm59JmsOygZHIifl28Qc49D1qHWSQfF
	Hbu8tpR3GpjC6H1whbzdQkW5qx3hHWbnxGxr43IkIzPed97yqiyMIoWspwh0=
X-Google-Smtp-Source: AGHT+IEWB7tBi7JGtQbX1WM80HBYeWQL4LG1xhguZ8b0CvUJv0a+SKXJBPC5JWj+b2DFXN8yyD+lm184jJWgFLvlptAUAb3a95gX
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:c24e:0:b0:423:fc5c:c7b9 with SMTP id
 e9e14a558f8ab-423fc5cc9eemr20438445ab.1.1757847063795; Sun, 14 Sep 2025
 03:51:03 -0700 (PDT)
Date: Sun, 14 Sep 2025 03:51:03 -0700
In-Reply-To: <684ffc59.a00a0220.279073.0037.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68c69e17.050a0220.3c6139.04e1.GAE@google.com>
Subject: Re: [syzbot] [sound?] kernel BUG in filemap_fault (2)
From: syzbot <syzbot+263f159eb37a1c4c67a4@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, chaitanyas.prakash@arm.com, davem@davemloft.net, 
	david@redhat.com, edumazet@google.com, hdanton@sina.com, horms@kernel.org, 
	jack@suse.cz, kuba@kernel.org, kuniyu@google.com, 
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	netdev@vger.kernel.org, pabeni@redhat.com, perex@perex.cz, 
	ryan.roberts@arm.com, syzkaller-bugs@googlegroups.com, tiwai@suse.com, 
	willemb@google.com
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit bdb86f6b87633cc020f8225ae09d336da7826724
Author: Ryan Roberts <ryan.roberts@arm.com>
Date:   Mon Jun 9 09:27:23 2025 +0000

    mm/readahead: honour new_order in page_cache_ra_order()

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1100b934580000
start commit:   b4911fb0b060 Merge tag 'mmc-v6.16-rc1' of git://git.kernel..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=3f6ddf055b5c86f8
dashboard link: https://syzkaller.appspot.com/bug?extid=263f159eb37a1c4c67a4
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=157cf48c580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=146a948c580000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: mm/readahead: honour new_order in page_cache_ra_order()

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
