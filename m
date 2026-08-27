Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68CA6367B72
	for <linux-sound@vger.kernel.org>; Thu, 27 Aug 2026 10:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787827323; cv=none; b=hHnbOkWdlzIcUrZ9BMed4CMJEuXuVIewWicaSQiVwMl+zyWOzKiQnmYE26OkiZn/vrrGG6EkmtrxSFrmhmVyRb2TqdCnOdTzXg2bl3uhIJiFuuRP3bDoJuSUKUV8YyRgTCpsFcm05+BVqCSxaTT6pHxC999f5M9EkyG3lpVAVYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787827323; c=relaxed/simple;
	bh=flCGS/7PHk+0hoFqtcQUigtTrygkVNvcRIaWkVdKTrE=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=I/lodiIvZLQEbERldmjCwwckmwpcPjHbZe0DA6rF4p4/mIQ5Cfkj3t1zKlo49c0yy+WPvm1vvvOoM84mQhwRr10LM+z4HvJnUzJZoKAuDIg5QgdmoKkh5lOJfQzVBv+mTgVG39GB30bCiQz6RoTlmFn9MUQj+3/fQa4IU3Y0yFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4b28d7ffab1so1711324b6e.1
        for <linux-sound@vger.kernel.org>; Thu, 27 Aug 2026 03:42:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787827321; x=1788432121;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=d1gnvgJOAISuTZRMtpIvypONLcOhVuVvfZm8n7xlhSQ=;
        b=KT0izQSQ1DPdsK1dHMJEq8Xn+m6K0c9LMZrhZSSeWawzADGZU4F+S2U0+jbI6MneWm
         f2SFr8Rsr3GEocngDCnb4sMpk1R9fqfJHb2oK2jfpNDcsx6TrjsnIR7eEXoBxsCtpYav
         u9/dTwUa858VwywYIL8jZqaBCxDsEnwVSSNRT20ZRl4VYxrUoE5FcANRLR/qbN1aEUbS
         6qIUZQFMR3/Kon2pSZcY03w3XvhiSQ8KKzaRaeuOEW8NHrfIxEgBl2vSEl1/PRrClg71
         bZ6fGBEaBVE+uYb1E6GRjXEYURrRimKD5mLCz0HwnQTSAePsTZ2aPSezXNmV3kFHVMfP
         GK3g==
X-Forwarded-Encrypted: i=1; AHgh+Rpipav7CoGV857dgWrQS3Ra6V7DtTiHrWwS9k88gg1kOT+ocuuuY4IE4x1wUGDjpyXOYF3w+FPwp1bV6w==@vger.kernel.org
X-Gm-Message-State: AFuF++mzZOdlhBYdOKNAWTCMXueNZkWk1yi3eJMEc6tFOXNkxYjgZiUK
	O+WMN13pwj5JLNdffGKs87guqaYicx0/sMjVBPp6hDSAeOyTX/YzlrxvRCVKxjiDOIdWy6c0L7B
	qnq7LuEJbdP6uekLT5f2QWCNfssThd0pjOp8m0dXpQApEts8Y7I90aY2RThU=
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:2222:b0:4b2:8e26:bdd2 with SMTP id
 5614622812f47-4b37cb42309mr5284504b6e.16.1787827321373; Thu, 27 Aug 2026
 03:42:01 -0700 (PDT)
Date: Thu, 27 Aug 2026 03:42:01 -0700
In-Reply-To: <20260827102831.21012-1-jeffinphilip14@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a901479.4d659fcc.734b4.000e.GAE@google.com>
Subject: Re: [syzbot] [sound?] BUG: unable to handle kernel NULL pointer
 dereference in snd_ctl_led_get
From: syzbot <syzbot+b7fe2760ea6f1ee44b4d@syzkaller.appspotmail.com>
To: jeffinphilip14@gmail.com, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

sound/core/control_led.c:117:50: error: expected ')' before 'return'
sound/core/control_led.c:134:1: error: expected expression before '}' token
sound/core/control_led.c:134:1: error: no return statement in function returning non-void [-Werror=return-type]


Tested on:

commit:         818bebeb drm/xe: Don't hand out the flat CCS storage a..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
kernel config:  https://syzkaller.appspot.com/x/.config?x=ccca94d2c01b9e78
dashboard link: https://syzkaller.appspot.com/bug?extid=b7fe2760ea6f1ee44b4d
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=11abd579580000

