Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EDBF411A1A
	for <linux-sound@vger.kernel.org>; Thu,  3 Sep 2026 10:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788429666; cv=none; b=LFg2PlofAFi5pJngl8Dz9UZqNarDM8+3VyUA3zFIV1iXFx0rNYvJCmBhsd9ukJdEs1KqpV+tdYvztOtPEpf84Q36rRj9dKBT1p7aPdte8F5tblNrnNpErES5iysD8GQmhoLgCYlvu3rEcE+9WFZZzj+wGJDCXGWgMADXFYyOOTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788429666; c=relaxed/simple;
	bh=ryInLUjJI32PSk+T2NMhpSbpKFvxq0wpSaolLnU3XEs=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=EMd+sySf2vsk3eCreXI+0Bi1Qf+OnR8eA1QgXQixuihX4kCILaJ+TEIU1f9N4LgCo35fgGkFloIuay71awH5zmeBvetwOjPEtkkXNyvRbhfIaWbnDWWbRxtaLtsokke+1xzIZh+6hUiNBkYo9TiKsa6QiNeKOeJ8wSUnfQxpAMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7f66ceea676so2709967a34.2
        for <linux-sound@vger.kernel.org>; Thu, 03 Sep 2026 03:01:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788429663; x=1789034463;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5+izbsP1CRuSYp7hZOU5ThuvWBJhaTYyEvZXcdhmlzg=;
        b=SzQtpbY/QSye0/wSJCKVU4T5zDFvnf8KyGrrHIK9+olwXQhcQh383LFZnSqIzwqatk
         aB0wlF3sntR1tGbXEcamr5hBk7FJrkeFB1Z2aXzlPYaK6xZayHEHYP02G6XS5/7M0j6Y
         wB1PL9Tc9oSDHcTjEpoVl8hWYAvTL1B9TCycDjPpX3w5uSkA2t/wGJa2eNfc7rdtzrku
         B17r623Y62Yy8xzQY+G1zSwyrOzkXpy9raqVrEwJ+9vk6xoMbyKCFqFtJvA7HGnM5JfH
         t/A3NXcsr5ZQe9ENjQLoSVv6eGt36Bh4QSRLji6m6hwpeUIH3QwCfE/LAj5ULjLsssdb
         joow==
X-Forwarded-Encrypted: i=1; AKwUvBxKw9CmsbnRwY2VNidZ+jq92M5sPWQJZzpytnOvKPXTHRcLYhhObDCBG6/SxrBk4HyjJVpRTHyj21LwYQ==@vger.kernel.org
X-Gm-Message-State: AFuF++lhS8APhW5vUigIsYxbcmUtxDcy11etH6inIgoBIlixh8RK1jmX
	07NIk8U4KAYxtrTN8w4nUVMHBnByOulEMvCPqzpo9FT9d8Q00fXkLPOIih/124zhGvKFLTF0wy1
	OROvVBmHk2maNE10tDhGuCVCVAp/mV2ticuxxbErmftH6yQLBQPPLKzBtsQM=
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:f004:b0:6a3:1dc5:3570 with SMTP id
 006d021491bc7-6b47eed58c0mr8176756eaf.31.1788429663005; Thu, 03 Sep 2026
 03:01:03 -0700 (PDT)
Date: Thu, 03 Sep 2026 03:01:02 -0700
In-Reply-To: <20260903112417.21b76017.michal.pecio@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a99455e.9266084e.bf0d7.01fa.GAE@google.com>
Subject: Re: [syzbot] [usb?] KASAN: slab-use-after-free Write in usb_free_urb
From: syzbot <syzbot+832ce9fa3face1b7d44d@syzkaller.appspotmail.com>
To: bolewara@gmail.com, devnull@kernel.org, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-usb@vger.kernel.org, mchehab@kernel.org, 
	michal.pecio@gmail.com, syzkaller-bugs@googlegroups.com, tiwai@suse.com, 
	zonque@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+832ce9fa3face1b7d44d@syzkaller.appspotmail.com
Tested-by: syzbot+832ce9fa3face1b7d44d@syzkaller.appspotmail.com

Tested on:

commit:         940de590 Merge tag 'hardening-v7.3-rc2' of git://git.k..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=13da7c15580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b454dc6b1b7acd30
dashboard link: https://syzkaller.appspot.com/bug?extid=832ce9fa3face1b7d44d
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=15527c15580000

Note: testing is done by a robot and is best-effort only.
