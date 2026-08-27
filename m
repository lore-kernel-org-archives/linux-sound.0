Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7451C441616
	for <linux-sound@vger.kernel.org>; Thu, 27 Aug 2026 10:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787828348; cv=none; b=McNSf262kuqkHunZEBo50U8vUl7iPqe2/jWKCJuQDPTEzmKVhnsUGZN0JubeCkK1HWVfBPgtBqXyCi910CA5CDMOjPABcpc80SYyiyLMOBplzJa4n110Urd5oiAejFRBxd+JSBRASGtA+b/GQ9EBkCbnd0mEWY42xGJkq48NCio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787828348; c=relaxed/simple;
	bh=JJ7xmZYsWxpHV3bmBvz951AQYyyVVFUDVSDdDqYE8OI=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=VV7QSp8Byrq9tna+zbQLpVmdiTTbkr7CYQk8VaQ81wzXHaJpEpBBBH9zorXOk1V2fEEjnm1bSNmTJx0wGcyPxsfdKx8QTm06uznDr7LvXF5cpbQcKq/ldvkRoWsCIV5Cl8Pd3rTiDJ90753eosFZJ0V9UcmppH5xsYEKGCNg6hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4b28db6c77aso3603710b6e.3
        for <linux-sound@vger.kernel.org>; Thu, 27 Aug 2026 03:59:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787828342; x=1788433142;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RdD8Z10UoycLeU+m22gUXOdbmaKrrKX9XGWwAQdeYVA=;
        b=FaDFb3/2AhdH7ko9vTqw0uR70O07O1w8U44dOwmGEXvXtcO4xTRuKwm1bQnJK3VyN/
         AWxP7Q1SbeWjRDyHAsQeKxc9/q6BOXbR04Ov10GItu3cSXHGF5oHLeeCyIlU+A6Nltgd
         HEzQACG3uZql4FcZ1qcgH7/0REncB3NcF5/0OyxTwNqCH697HJMa/iCW4SmC80v+NvjK
         YYLG+E3ROPCQkozUtq/F5aE/Oe/D0FppQBuuEuik7ESjXmUfRfZflb2ZO8oMcNB+lut8
         gy9G/TR2KzKGdzxuQj5sGRXRdcVSdPEAkYLNAPaOVk8+EqB0/IWCsk6elTAO0giHQn/9
         RD0Q==
X-Forwarded-Encrypted: i=1; AHgh+RrnNna70dm/M0T1l4QeXLRm7548JAvU2tCNh1vB04JRcfHophcgsm8/VrgcC8U5F3YKqehPN9f3S1QFpg==@vger.kernel.org
X-Gm-Message-State: AFuF++k7FSwLARHJKnwt5dBQ5z+SjMPykIT80XPOkyIwvM6SEpGGDnZY
	N7iXcmf41Jy3O+zskHnse6nWJjrS6pmoSozr26qEOPvCeYqIR29qe1zwMY9I1dUq7tcPORZ6iKp
	J9FDPLJu+Jy8vTZUKHRUoBi34hD+vecfWu3UY+A25gR1Slo94NLg240c+glc=
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:c164:b0:4b2:c80:e01b with SMTP id
 5614622812f47-4b366b49c62mr16408998b6e.14.1787828342278; Thu, 27 Aug 2026
 03:59:02 -0700 (PDT)
Date: Thu, 27 Aug 2026 03:59:02 -0700
In-Reply-To: <20260827104306.21231-1-jeffinphilip14@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a901876.27659fcc.2ceef7.0014.GAE@google.com>
Subject: Re: [syzbot] [sound?] BUG: unable to handle kernel NULL pointer
 dereference in snd_ctl_led_get
From: syzbot <syzbot+b7fe2760ea6f1ee44b4d@syzkaller.appspotmail.com>
To: jeffinphilip14@gmail.com, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+b7fe2760ea6f1ee44b4d@syzkaller.appspotmail.com
Tested-by: syzbot+b7fe2760ea6f1ee44b4d@syzkaller.appspotmail.com

Tested on:

commit:         818bebeb drm/xe: Don't hand out the flat CCS storage a..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=16e14579580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ccca94d2c01b9e78
dashboard link: https://syzkaller.appspot.com/bug?extid=b7fe2760ea6f1ee44b4d
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1714e579580000

Note: testing is done by a robot and is best-effort only.
