Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD7EE2E264D
	for <linux-sound@vger.kernel.org>; Sat, 27 Sep 2025 14:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758983405; cv=none; b=JB1hVKbA54SwRohvyXS/A/+JgN1NDHIlviB7ED/svdBd1s7eCcNdZK4xTR4lNAhzggjr8LoBG0egwnjMH1AQgjc8vGgKDnZYSD4oR9MgQT4Wwg3ogac4d3fPAlTQICo3XdYFDTGssH89gyaSQAApkpFZjFoUv1jQqfT25bDOcgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758983405; c=relaxed/simple;
	bh=HlWr2hxvgCzMr6T9I/wPkSInGUI8639MvjLuCSeEIqY=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=JrCgwIDPYw6K4M37UZTiR1QnUavNRG2eZvtSO1mpcO0XSa1329cMCWGjk/7NO82ZHbTbl2SBsCkMMLtKPiikznlzudiVpIxDcPvo4lduK4QUc1xSFiIi6RLXLRHglF3jUn7kUQrFbHh/16CiHKuqt8L9Ir+ZL1ETIaHbv7S+5S8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-896d8bc595aso733921239f.1
        for <linux-sound@vger.kernel.org>; Sat, 27 Sep 2025 07:30:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758983402; x=1759588202;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bp2EzkceCVTt1yni6fLpho2I/VHM3NnkTfrbWaqTRQw=;
        b=BxnAWm4jU7yTdR5xOJvdTXZVz6rpp49Ny+kBEDIkM4R50O9td99mPhlvQCF41rbvG9
         YMPYjKY40KKbjHeAs5233MaIWpXKAsnmjDT1u+NoXJmEPHdhV+UYL/ZuM7G+ri7tE8nB
         +BIdD6QNX4Pf7/zdCqdIiieS07hjhONudrzx72SlNSAVX+WY+x/1wDwDoLghP/4iz3Kq
         zdOn1Ufxk60wzT/QefkEnU0VZ1J61WLlH713XHzHCTYZOr6TdRS+G0pmheTwn3l6R2Em
         E848yYibkSHPFUs7COaPD2+eRGC9ypu9W4qy6Ln1rDrFoVUvw6/70rhL0yhKgTXDHWMP
         kq+g==
X-Forwarded-Encrypted: i=1; AJvYcCWL5atXWiL5FSu7s4r8GpqlCMdyPCkX1VNNoSJsqItrZxu7RjgMf+5QoC8GzH32UM9GFSahMHH528HCBA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxKIYfO+0ruww+FfBlNLR3KyzFXI2rUhVdTGDYwC9H0HeHWYT8I
	TO9OjW6QKIO5O49s5Zkqzpxm3HDOUcmQL5XCiXdWL1+CML1OhceP7KycxuOo+RqgwQrOo36nW3N
	0L02nv11skqklnxAC2/rMwbLIY37e4ocCfIoy72Id509TaQ09qiY+yPr87pY=
X-Google-Smtp-Source: AGHT+IHvNyYaqahkF7F3fWDdV0PhoEVP0kpN0AV2iVrAvGQ19veQZ5OjBoZe/GHYs9sd+fju1wALpEKK8DzoWBaijB5xqxlcMKpj
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:12c1:b0:427:9523:2e98 with SMTP id
 e9e14a558f8ab-427952346c8mr90797315ab.29.1758983401963; Sat, 27 Sep 2025
 07:30:01 -0700 (PDT)
Date: Sat, 27 Sep 2025 07:30:01 -0700
In-Reply-To: <87ms6g9kn1.wl-tiwai@suse.de>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68d7f4e9.a00a0220.102ee.0017.GAE@google.com>
Subject: Re: [syzbot] [sound?] [usb?] general protection fault in snd_usbmidi_do_output
From: syzbot <syzbot+f02665daa2abeef4a947@syzkaller.appspotmail.com>
To: aha310510@gmail.com, clemens@ladisch.de, hdanton@sina.com, 
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, perex@perex.cz, 
	syzkaller-bugs@googlegroups.com, tiwai@suse.de
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+f02665daa2abeef4a947@syzkaller.appspotmail.com
Tested-by: syzbot+f02665daa2abeef4a947@syzkaller.appspotmail.com

Tested on:

commit:         fec734e8 Merge tag 'riscv-for-linus-v6.17-rc8' of git:..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=12cc82e2580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=927198eca77e75d9
dashboard link: https://syzkaller.appspot.com/bug?extid=f02665daa2abeef4a947
compiler:       gcc (Debian 12.2.0-14+deb12u1) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=124c5f12580000

Note: testing is done by a robot and is best-effort only.
