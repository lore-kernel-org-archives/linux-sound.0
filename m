Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E323FAE1D
	for <linux-sound@vger.kernel.org>; Mon, 18 May 2026 16:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779120053; cv=none; b=jslI9m4izSnZclRdeO5LQcbTpFJK0YVZmuoLSYgOC4lZJfrq/1n69n6rnF0ar2RONL33o0GRIrqMRBkFxMUjQYQHyZFhpumTg+V9UjpsAQHVYrDhazgRe1cut3GDOVYdNUviQT1JDCrGzuZMST/ga0eyaI/u4ZbDYo7ZNPrRcvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779120053; c=relaxed/simple;
	bh=ieOV+o8gPZkNv6bcagFTRTdIXtS08vega1cz4HTnRyg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Z6akMBarXvMK3fBQqeFHZTg3uYc8WYq6TlvoDy+OOku7VzpnO3zO/xBv/zUfxrmTagqWXh/6Smm+3q5wtHibYTDfNaVRGWDu1G3E5MmxOvWq0Y8iKj6f5xp3NUuYwmpjeUZ60kqN5EeHG1/5E6KX+OBuEuNL77BzoyPVGHVmCw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e5BpZ1PQ; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e5BpZ1PQ"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-369742178f8so1356099a91.0
        for <linux-sound@vger.kernel.org>; Mon, 18 May 2026 09:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779120036; x=1779724836; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1P9Pumhzo4xFId6dhvQoSs/K6cq6qzesEQoaX9OecWM=;
        b=e5BpZ1PQOf1Ye9+Ml7Xlr1LlhZkZq3/cEi7gx5sxHhVs3Lrn5GT1cZ/l5t31YSFFgb
         DicfjqCu3aR/W+LQ7+WGNQEwjc98M/a7ccY8eTjeU1cFolcDS6FFpMIi5bs7wI4USWbG
         tg0Bxvw7fl5CnOcLAES1lC89eimLwiw88YLyk9/H/pEkrVca5jGpd9bzatOmDu5aZ7sk
         ugCHDD3qDuTe8VGLfcChsnXOVokI9zbxMV/98oAzRL7JCLPYurIa3zuK2C3c0chCR2FA
         MseLwMh6nadLUm89//LtUpbkWUFmpzB6aq9X/P16CmjQ80m7j3E/kZTzps77vJ5khj06
         16Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779120036; x=1779724836;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1P9Pumhzo4xFId6dhvQoSs/K6cq6qzesEQoaX9OecWM=;
        b=QSgO0lrqT79A+5S4WHX76wWkJmEXOvB0sGxHMd0pz4NGLQAl4P32Q5CfEPZPwKrSEk
         3Tg4Nv+QEmj7quejtFPb7hEaplK+Zgmva56a7GFDwXv3dwobPFgM5d8WLP1sfcfkDOr8
         RrvWXPofqZQWS9ysOXcJVuG7RQYBFlR/SbrNlE23OSsIwB6n56hE2XpfnUEzF6Y+I5fM
         FEODOkdAM5VaM+cFwGJdj5Io4ZzdWVZaVdiPn+3uZaBLbMXDOB+hnbiQ7N3S9ttkcyKK
         8dXR8ZTHxKEr+CMKcgJn35cV6QB6atcy8ZKqaMmOgS17diIZ+p9Lzjbv81GwXHuIgtID
         jqYw==
X-Gm-Message-State: AOJu0YyLJOO9hxse+/05Br9HAXQRgLvVtu+iyJ9GJwz39dj4SpKF8/VU
	NbqDLqUNRzDiZQzp6BcN0ckWg89wQQ7rc5lVm1tgvLFge9QNLjVKhUV7SvXBkA==
X-Gm-Gg: Acq92OGap0NJztUewQsZXP7tHY2hjj4ds6Bbz8+emSwCwiVQiLaVOcV5JYSiOKq+xLI
	u8W4tDTA2BniWDDWqHdYQFeo7HpM5R0sKG1cEzoNEKC4+sNgevxgA6EKOAKfrI5PEfefOAqRPTE
	INcuLmmgQPSdp26WeyH+r46XBv2kzQO2jFx5BMQ+prPt22WmksB4yH0TXApp9m2KjHh7FP6CjMC
	BOa5cALPu75kPEwBxAsokfhQA+C2Kw/FbtB+wC3efm1vmBY/AhlflEZtFBzYAoJexSXYHrLzPOD
	zIv7ZUh74IjYf6LqTfXXMkR0JvayTdVNrGHu/EDNrdStfEEVDYkUiKKQBQAco01hd+kkcLgMTIc
	iGv+nB3iOzmKmn1Dv7TBb8UI5mlkZOt6umkKZl8JWLlsj+Wu1pAVvr47D25eq1w0CyCbmCdvwTu
	k0ibTBPzO9TffDM8m7/5O6bldP9NYa76p7X8D3QpqvSDjIYnI4
X-Received: by 2002:a17:90b:270d:b0:368:1064:62f2 with SMTP id 98e67ed59e1d1-369518b205fmr15020093a91.3.1779120034444;
        Mon, 18 May 2026 09:00:34 -0700 (PDT)
Received: from csl-conti-dell7858.ntu.edu.sg ([155.69.195.57])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5cfe64a9sm155831905ad.53.2026.05.18.09.00.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 09:00:33 -0700 (PDT)
From: Maoyi Xie <maoyixie.tju@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: ALSA: iterator used after loop end in timer/seq port registration?
Date: Tue, 19 May 2026 00:00:29 +0800
Message-Id: <20260518160029.1529836-1-maoyixie.tju@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

While reading sound/core/ I noticed two places where the list
iterator is used after the loop has walked past the end of the
list. I would appreciate it if you could take a look and let me
know whether these are real issues, and whether they are worth
fixing.

The first is snd_timer_dev_register() in sound/core/timer.c
(linux-7.1-rc1, around line 1018):

    list_for_each_entry(timer1, &snd_timer_list, device_list) {
            if (timer1->tmr_class > timer->tmr_class)
                    break;
            ...
            return -EBUSY;
    }
    list_add_tail(&timer->device_list, &timer1->device_list);

The second is snd_seq_create_port() in sound/core/seq/seq_ports.c
(linux-7.1-rc1, around line 147):

    list_for_each_entry(p, &client->ports_list_head, list) {
            ...
            if (p->addr.port > num)
                    break;
            ...
    }
    list_add_tail(&new_port->list, &p->list);

In both cases, when the loop walks all entries without break, the
iterator has gone one step past the last entry. &iter->member
then aliases the list head via container_of offset cancellation,
so the insert lands at the list tail. That is the intended
behaviour, but the access is undefined per C11.

Jakob Koschel cleaned up many such sites in 2022, for example
commits 99d8ae4ec8a (tracing: Remove usage of list iterator
variable after the loop), 2966a9918df (clockevents: Use dedicated
list iterator variable) and dc1acd5c946 (dlm: replace usage of
found with dedicated list iterator variable). The two sites in
sound/core/ were not covered.

A candidate fix would track an explicit insert_before pointer
initialised to the list head and overwritten to &iter->member only
when the loop breaks early. The observable behaviour is unchanged.

If this is intentional or already known, please disregard.
Otherwise, I am happy to send a [PATCH] or to leave the fix to
you. Thank you for your time, and sorry for the noise if this is
not actually worth fixing or has already been spotted.

Thanks,
Maoyi Xie
https://maoyixie.com/
