Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4D8B2765C3
	for <linux-sound@vger.kernel.org>; Wed,  4 Feb 2026 04:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770179532; cv=none; b=tIjf/BGjDSzVZ/IA9sl9wd/8n4tHGdV/Aa6Zt+EL5/tdii1yYts1qGfpxEG+eBTdAF1YCvG+51zHxwBDP9u1u31SDQyw7F1neZ2rggrc065jr9Evn8u6PKB1tKW40CHAYd5XCIjg6kriE9zF4IvH5rjmhRq3zPhjsU8dp8yGWvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770179532; c=relaxed/simple;
	bh=X1Kr1OyHHYSD1JHZHZgyBsiAnsBVF3CxR/1W8MyYNW0=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=AOYFgP6uxC7KhTYmRZf9fqAwxvakNrURXGySCt4xh6j7ZYze3ddjgG3hDbHwg6+1A1TrI8GqYF6UONmyIR68qfUqwaHYSkR/UQkB003UBifQnXeKIqgBmRt1nTTYP9EPcbPb1oSI7nb45MywPM8M0iw5MqB6pERSsQhYccNFOW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-40805ab764fso1654983fac.1
        for <linux-sound@vger.kernel.org>; Tue, 03 Feb 2026 20:32:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770179522; x=1770784322;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vLOIj5H519mZHspqU5zX/aCaORqG7D8dhrXyLXEpUVk=;
        b=eWQWQdD4GlFnwcXV3LM/qDwzaO7pwlC19TapA6DsY7n/6SnhGbZ12/FfFRNQgVSlig
         V1Ux9lPfRsCioAk6N16lEqj65hHkyjXizZPZtVVzHdONilgVbJcdVp4eYhAUUEQgHBr1
         zgrkCbvgi+59P1E14maANjI2Ibr7YgrZ2GUemLAaAO7m6otvZmUfupPOzr/MyyKzS34V
         yAy8EKsRVWX+Z/WD1Qc5vGdc/DI0sPdipGCHtNBP8KdshECGx4Qn8U9AFRog8i1KXZaJ
         6kyQrm1mM1ry68US/JgsO3e5ivNu2PnVPkiDnuWmYzB7KSr/2S8qn/6YaRXgib7+106p
         yDfg==
X-Forwarded-Encrypted: i=1; AJvYcCWUtugjmyriDc2VPPr6Rl/rjHV1R76SJukvnF5INO2UFLtvymn8K63BIOWwEqcwcixNcC9O87v2HEGOYA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxPFyA4n7u66WP3p4mVkdVclUmsGyRNmYYcVbA9g5uwzuhSzYub
	SEMmIkMFh/qFTwjULKQFhq8+QYTeikcNKsgfAh5eVouOIej+4bzGIlMvDQUfbXCTbXJ4w7PFf4e
	GmQtnZYkts3tbT629kceIj84odPLihTRBgPCC5JrcKUiNwNWcIslY8ARdyxg=
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:2291:b0:662:f74d:69f5 with SMTP id
 006d021491bc7-66a2113d4bamr1021474eaf.31.1770179522145; Tue, 03 Feb 2026
 20:32:02 -0800 (PST)
Date: Tue, 03 Feb 2026 20:32:02 -0800
In-Reply-To: <20260204032856.2561-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6982cbc2.a00a0220.37c87e.001b.GAE@google.com>
Subject: Re: [syzbot] [sound?] KASAN: slab-use-after-free Read in snd_pcm_stop
From: syzbot <syzbot+5f8f3acdee1ec7a7ef7b@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org, perex@perex.cz, stable@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com, tiwai@suse.com, tiwai@suse.de
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+5f8f3acdee1ec7a7ef7b@syzkaller.appspotmail.com
Tested-by: syzbot+5f8f3acdee1ec7a7ef7b@syzkaller.appspotmail.com

Tested on:

commit:         5fd0a1df Merge tag 'v6.19rc8-smb3-client-fixes' of git..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1582153a580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=151a39927f1e10b4
dashboard link: https://syzkaller.appspot.com/bug?extid=5f8f3acdee1ec7a7ef7b
compiler:       Debian clang version 21.1.8 (++20251221033036+2078da43e25a-1~exp1~20251221153213.50), Debian LLD 21.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=11a30b22580000

Note: testing is done by a robot and is best-effort only.
