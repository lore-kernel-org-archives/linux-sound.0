Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F4931F470E
	for <linux-sound@vger.kernel.org>; Tue, 22 Apr 2025 18:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745347736; cv=none; b=IkqX3gLXaYwHahdO5bT/IiyqZhaCHmPYcbLlKpjTiofYpBlxpHVC+4YxL7v95wEY3VxrYnPJuUqLmu7YL4TX01vXnbBvVjV24BVTQWrm6LZfYtgmdwGuEEfg48Q/jXyCX6sfvjZNe+BQoPixirjPbnN4EKABPfpduVZ6zz/6V+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745347736; c=relaxed/simple;
	bh=fAgrU4fXRXK/RT/5xdI9ErP2D4G9DiMk6/mOL4Z79wg=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=a97VXOBoWxqKcrg1gtQWVDySgev03O/BqB5KrjeLSJerz0sD8c75l6vmYL2SPrmUiyEaP7hupBhjFPdQXDJG17mf5IfN6VDZX1SLpGQssCmr65X84MrxrdxSNOAlneBqwebUYTs6CKmXoON+6FGYxNpeqQ+xvmJtVQ+gmrcQFro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tavianator.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tavianator.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ac25d2b2354so792351466b.1
        for <linux-sound@vger.kernel.org>; Tue, 22 Apr 2025 11:48:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745347732; x=1745952532;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ECuX4CqPzNB7zzm+S5u9lv015xZJRzBfmxQDNbBI910=;
        b=G4ett4AAvT/1l8iIe+GwYcvJ7vl2NDGQjEqRpQ2wsKeMpaccHXcCQg6pD0aaa95pVg
         ejyq31IeF7rFFU8arc5UkG4fl9btXLSZuK2otJbGmIE01hyxvcU96Q3jd5MdiKAA+34w
         xGEfolHYDZKqd7XV2vCMeubD0UaBPwKh1p/gH6XpPUJOkNaN0mfkgs8FsdbCZXHzbx6Y
         455k2IRSxiPTQ1kmjtFIgXBhspxhyO+9LGBnwpFwSqkMilO7PKuX15C05oJNKsonZJiQ
         fhvDfqPcyTkTQJMSACfupjJ4JYwfWwdDDcogm9w5b1VkpgI6BJtycjKcTXVZzX4K/SCO
         /Zcg==
X-Gm-Message-State: AOJu0YyBtRU3OaqhLU05A+xNfD+ZT2oHCaryv+f2hCfBTf01e6EJEF/s
	akWZdX+M9cQ5iQtdhHJytC2MnpqhgFNyISDCZvchM6apQ7yGRjDN1heKFX70
X-Gm-Gg: ASbGncu4Y/aYsDOaVu9kLCGrS9xDfq/bQvNqVIPfv8AACXrIiBtt7i4CnvAhnjYqFLB
	xR6yUeEE7fNNSS+4j3yjNBgtOFELouLg1d2PXW0cTIXHRzoI337Tm6YjDOhMjwvkHtHDUNTp6Ta
	UuwTAWHisl5UM6BNSnrzoqAZNs8/sU14nWEqjr1pROQmYqw5J+YcOEYo76Z47P2qNoovQpN+IQ1
	06ZLcXBvXJyG1U3f+x8DctLglAIv4H4GEUoF17J5m7PBdP/D/mYXXdnE+3nr8Wku08kkXjY7UTu
	/l9sgGOcDljfGe0GaBi67DrYwn6TEBHmn5F5xrkny3eiGB1sG7yTjFaQ8zeIwETIafmqnQTULRm
	EKKs0FQh67g==
X-Google-Smtp-Source: AGHT+IGMVPQsadyQ+P5/DpumRe0s2EWDrIEzQJrwsPgYvNf12EZrPF2eZs5s65rxJaqqtJVh4vVnsg==
X-Received: by 2002:a17:907:3da6:b0:abf:733f:5c42 with SMTP id a640c23a62f3a-acb74aaaea0mr1332175066b.8.1745347732043;
        Tue, 22 Apr 2025 11:48:52 -0700 (PDT)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com. [209.85.208.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6eefd897sm691344066b.93.2025.04.22.11.48.51
        for <linux-sound@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 11:48:51 -0700 (PDT)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5ed43460d6bso8321906a12.0
        for <linux-sound@vger.kernel.org>; Tue, 22 Apr 2025 11:48:51 -0700 (PDT)
X-Received: by 2002:a05:6402:524b:b0:5ed:89f0:27fd with SMTP id
 4fb4d7f45d1cf-5f62857931dmr13675401a12.19.1745347731619; Tue, 22 Apr 2025
 11:48:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Tavian Barnes <tavianator@tavianator.com>
Date: Tue, 22 Apr 2025 14:48:40 -0400
X-Gmail-Original-Message-ID: <CABg4E-nVdZa9oOi3a6FYQ60Wc93aq_8CpO2J4nZxVv94o98quw@mail.gmail.com>
X-Gm-Features: ATxdqUFxck-m0jjvl5AqvurmSc5jAawlM7GbU7Mm7TCXi2p_AaZ308rGb410wwI
Message-ID: <CABg4E-nVdZa9oOi3a6FYQ60Wc93aq_8CpO2J4nZxVv94o98quw@mail.gmail.com>
Subject: Bad topology file paths when re-inserting snd_sof_pci_intel_tgl
To: linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

I'm trying to debug some audio issues on my ThinkPad X1 Carbon (Gen
10), and I noticed something that's probably a bug: when I remove and
re-insert the snd_sof_pci_intel_tgl module, it tries to load a
different tplg file every time.  Example:

# dmesg -t | grep tplg
sof-audio-pci-intel-tgl 0000:00:1f.3:  Topology file:
intel/sof-tplg/sof-hda-generic-idisp-4ch.tplg
# modprobe -r snd_sof_pci_intel_tgl
# modprobe snd_sof_pci_intel_tgl
# dmesg | grep tplg
sof-audio-pci-intel-tgl 0000:00:1f.3:  Topology file:
intel/sof-tplg/sof-hda-generic-idisp-4ch.tplg
sof-audio-pci-intel-tgl 0000:00:1f.3:  Topology file:
intel/sof-tplg/sof-hda-generic-idisp-idisp-4ch.tplg
# modprobe -r snd_sof_pci_intel_tgl
# modprobe snd_sof_pci_intel_tgl
# dmesg | grep tplg
sof-audio-pci-intel-tgl 0000:00:1f.3:  Topology file:
intel/sof-tplg/sof-hda-generic-idisp-4ch.tplg
sof-audio-pci-intel-tgl 0000:00:1f.3:  Topology file:
intel/sof-tplg/sof-hda-generic-idisp-idisp-4ch.tplg
sof-audio-pci-intel-tgl 0000:00:1f.3:  Topology file:
intel/sof-tplg/\xa0\x11\xaf\x0e\x8d\x8e\xff\xff\xb0\x11\xaf\x0e\x8d\x8e\xff\xff\xb0\x11\xaf\x0e\x8d\x8e\xff\xff-idisp-4ch.tplg

The second time, it added an extra -idisp to the path
(intel/sof-tplg/sof-hda-generic-idisp-idisp-4ch.tplg).  The third
time, the path seems to have become totally corrupted.

I'm seeing this on kernel version 6.14.3-arch1, which has no
sound-related changes from the regular stable 6.14.3 kernel.  I can
try current master but I don't see any relevant changes to the code
that adds -idisp in sound/soc/sof/intel/hda.c.
