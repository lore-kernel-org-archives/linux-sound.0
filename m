Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2150F1DF246
	for <linux-sound@vger.kernel.org>; Sat, 27 Sep 2025 16:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758989827; cv=none; b=dEheKVmtBb1EXokF9CXlqjtJyOTSQLbznarcmWpGSY3WQ3I4vf0ZN4aEUrK8VHrVGiRQ5nmIf3t4vyqYKVpTZ3eNMVPSeFaJL2kIap+hY590UAY51WIl6mDiD7uTe8ghkaaKnsqpmERzC9cmGwITOkgoB3jLM3FnWSti1mAvMmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758989827; c=relaxed/simple;
	bh=ZhYGnuimVDp77CEJ8QFQB6JlVaem8JOVFAVKlDZBrlY=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=G4iC+4CCHTmwgQuXY7Tf/iQXQk+wkdUodjRNIsjAK9ksDWlLiPgIdsF5NaoD6kAlgxAME4/NPwqZfdcMJoO0ht1rWkdI5TwhI0Kyc6WDDMdjYdwxDloCmkbGmESS4BOV1QPyUmdFKzudzTsne8bDjoSuSro+agw7Sf9dnKMjZ3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-88c2f1635e1so332781439f.0
        for <linux-sound@vger.kernel.org>; Sat, 27 Sep 2025 09:17:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758989825; x=1759594625;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kVQbaBUvQVjCtCUhJOoM57In+JvEnbQIGbVccfuSBas=;
        b=h9hkaNkUdV+mck74mQdXzHKNzCSUSDFQKOqLrq4i17dxLRz+L+f09AB5/iLz9gOANQ
         8Hguoe3FZA761dI6vcz/+tGnO4tIGtGqL1fOwpHJYiyuejjl2HD3VyilZF0dqk2vR3t3
         y51qgJ/IZaEXfsYDBFxoch9zMBe90F4oOb7iqARuqY3mrBjft/OQ6FsaV2CKAyGVkUg9
         BgJegtRoN1ZkOnUjrIu3F4dJtN5f6JMbSAMpRspcaDc+2W2TWVjOMKVeKMkc26bAqOkM
         NmrpGaStowUVL4FunY9N0ys+pGK+Wp9pbFw4Ed9OOLl9jo8hdBH323ZVUh8DBpNOp0ZX
         dzXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrk0nUCppKS/Sz/1mVZnPRzurTzFZJb+rDPxGc2QwldkJymoV4BrLeZT8Epy8UY9qwbSqtWsUEaoT39w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzAmeqrWoZ09+DW3znN8z4KVezgzF8H+O5vAsLCMLQ0pcGz/mEV
	88Jitkzlw/+T8+PRHfD22l+ZebQ0I4Rj+i5XZoFhtk5+c/KfLOMpOHDwVuL1qDJK+RY/mER4cc5
	vvQZidBPmyq1QcWxINAA5Sv1yf59GwLLjC1GlaPhQmyiKvy29c5z28pS/GHo=
X-Google-Smtp-Source: AGHT+IHMe77fsGECZSWn321pp7bP25Iz28ilihBiPhmg9TpKpPpuJCFKrJtFq01EcuSZm0IbZEA8PKOCB68sKUeAN7hqXsbpVle3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3e93:b0:425:2e8d:12c4 with SMTP id
 e9e14a558f8ab-425955fcf5amr164780725ab.3.1758989825195; Sat, 27 Sep 2025
 09:17:05 -0700 (PDT)
Date: Sat, 27 Sep 2025 09:17:05 -0700
In-Reply-To: <20250927155052.880528-1-aha310510@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68d80e01.a70a0220.10c4b.0015.GAE@google.com>
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
console output: https://syzkaller.appspot.com/x/log.txt?x=16295f12580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=927198eca77e75d9
dashboard link: https://syzkaller.appspot.com/bug?extid=f02665daa2abeef4a947
compiler:       gcc (Debian 12.2.0-14+deb12u1) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=169eb142580000

Note: testing is done by a robot and is best-effort only.
