Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08B4F20E334
	for <linux-sound@vger.kernel.org>; Fri,  7 Nov 2025 00:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762474325; cv=none; b=TE66LIluHSzjiJN6LfS0J3AIRD4EWJ3Ivfv2fVjU1wXoXmaxdHHyJOWrE72PgGkKOBSbWhBXf31S8YrpgwxDfRL18QHi9MWND+cDQbL0VtF6qraTtD4I7YVIOti5/Rz+nCtLnSjMJbcI/8zXmK59G4/ereEC/KBy7V9izresQVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762474325; c=relaxed/simple;
	bh=aVdPYmzSKWOH/QKiXcBzKUG/kuPP4RUbIPFsSXqcIP8=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=GmzP1UsTdSltud5m6KUz2QxJe9aZOE0GB4+jKhrjCVYDJ1hKq9XAdCBsFobHT2Yby/9EiblBTL1gb51SPiyWYBevW6JmI1g1i0kKzHLsNGDxr4/Mys/AqvAsQ/gEz62Q/EpN6R4FzLQa2zDjgin8nLgTTj1A4mPXNlFva19/CU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-43329b607e0so4147545ab.2
        for <linux-sound@vger.kernel.org>; Thu, 06 Nov 2025 16:12:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762474323; x=1763079123;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/spXl3uuTsx8sDbawOIWZLwy7Gm9R+Wn63YjTrF8mdY=;
        b=GMKlDDDOpkcC/LLLFM01nXLY+gdpy+PC2SnYjqH84Wf7x/xyTBFsXwZEE7shZHsTWi
         A/CDkikFc2WEzycnnmNJISlFeW189gvQPozz8Vk6J1BLb6n9ZsJ9aLIQUoMorW27QlWD
         scQsR3zgwJyM7uLrvkkNfdNtdpgR7Ij5u652EGkzTuDwEgH31V8x5MM9803TIcbD1dsh
         GUZSws65y1CqEjUIfRhjIdTA5Rm19/M0MhYpl20NlD2zk4yolPyIZuNW9NujxyxDxu75
         xD8D/HuD30IUY2pTHPCYgQkmcO3tXopfug+s87DjYomGr84PN0u0ynP1FPR8gtV3/j8v
         hK7g==
X-Forwarded-Encrypted: i=1; AJvYcCX6V/mgKQL9XZKMLGuJNeGin4ScQZcZ5PyGSE93GdUE/OlllDdO8VnFS5AwxzokGXC09dhBEzgU5kWMYA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxKY2kpCsnL/j211ZP+HAIO3FMpc2k+rcQS/bXq4R40HdVZ+qWu
	aAebBdJuRyGQI2MWC+7JqoAOEgBc7zfRFsRDY+2S6S8Tr2w+FBzVjvTlJvD6WLJH6YZzXWHVT9T
	J0WXW51qRs1QISnNWoVaDYdXFP7mjjanp+AOz9u6qHcxlBUGNCPKae33M3+A=
X-Google-Smtp-Source: AGHT+IHpSZmQHjj2xw1LrKSeIaGiCVAzshnJrIOP1c7YWbQBC1A1pEDfCWPYVr4zh9uN5K/DzxzgdlImZ3ehmMsUuPeiL8wG0i9C
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:144d:b0:433:4f9c:96a7 with SMTP id
 e9e14a558f8ab-4335f3d09f6mr22415875ab.10.1762474323196; Thu, 06 Nov 2025
 16:12:03 -0800 (PST)
Date: Thu, 06 Nov 2025 16:12:03 -0800
In-Reply-To: <20251106235128.8908-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <690d3953.a70a0220.22f260.0011.GAE@google.com>
Subject: Re: [syzbot] [sound?] [usb?] KASAN: slab-out-of-bounds Write in copy_to_urb
From: syzbot <syzbot+bfd77469c8966de076f7@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-usb@vger.kernel.org, 
	lizhi.xu@windriver.com, perex@perex.cz, syzkaller-bugs@googlegroups.com, 
	tiwai@suse.com, tiwai@suse.de
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+bfd77469c8966de076f7@syzkaller.appspotmail.com
Tested-by: syzbot+bfd77469c8966de076f7@syzkaller.appspotmail.com

Tested on:

commit:         a1388fcb Merge tag 'libcrypto-for-linus' of git://git...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1581d812580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=929790bc044e87d7
dashboard link: https://syzkaller.appspot.com/bug?extid=bfd77469c8966de076f7
compiler:       Debian clang version 20.1.8 (++20250708063551+0c9f909b7976-1~exp1~20250708183702.136), Debian LLD 20.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=10ae2a58580000

Note: testing is done by a robot and is best-effort only.
