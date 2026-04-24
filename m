Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD4E3246EF
	for <linux-sound@vger.kernel.org>; Fri, 24 Apr 2026 07:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777014739; cv=none; b=Ra5Ue4LXZT4StzPPP1U8YcUysaIJwMJfkuq4V0AptA2pYooVxQ+sDbsMLfgxBrYtM3jc7FqEk8IXcGsBbBbN04znrkIoPT5dU6GMXiGJPhXttC43Bpeon3teRjnygCB7npoAltsc+nhb6s4Ev3alZg6lKV0NEMrhSA4MwezRWWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777014739; c=relaxed/simple;
	bh=+MMxXr52Maj39GjmOnu/1e+16jAfJQ15YgGr4S60Cxc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JaivFJRfvXvI0StaiJAJALueMKsK0RHVZsxl7aZFj2uqU6mAda07f7LIT+/K07nGibXFLRQbXFiq0dq7n+ZgYmWeMtjBJ4Mfb7XsE6KA7dwuWcgFhRb0SmCtnKr1jKBiy697xb8Hpjooo2xqCo87auD+IxRSximfw9KByhkPhTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=snu.ac.kr; spf=pass smtp.mailfrom=snu.ac.kr; dkim=pass (1024-bit key) header.d=snu.ac.kr header.i=@snu.ac.kr header.b=drw6kPEF; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=snu.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=snu.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=snu.ac.kr header.i=@snu.ac.kr header.b="drw6kPEF"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-35d971fb6f1so5975159a91.0
        for <linux-sound@vger.kernel.org>; Fri, 24 Apr 2026 00:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snu.ac.kr; s=google; t=1777014734; x=1777619534; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bSB8eHNTWglbhom7jqMObvhP+66e0F4LO6bcsIBXY0U=;
        b=drw6kPEFVuseaQZsbpAvbnocE+z5zV5Z3+Y4AO04KSC1jYihmAlSuofwklW66mqDr9
         III/1+UBD2OWZjYtbQR48ZyqiLhKoi3c0JhPwcBh6VPK2V/Ar78Bgf8qPyhqKP0pVnnd
         UOFpBmRXsfgWesd7cMfEbDlAWaZWAH/Zh0wJ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777014734; x=1777619534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bSB8eHNTWglbhom7jqMObvhP+66e0F4LO6bcsIBXY0U=;
        b=PWc2JWdB65Hcn/00nLvv+/ZL7t0VKM5JHgKgdgOdsg5kM79suKoSjCk0ZGyi/PjKdF
         X1VJ/+WIswGWCkz0/By3RR/AoCRHEklJ1QMMeDWIdl5TtvT7OFcMwUG8/ZQU0DJVeShv
         +SFK0MwQuvJ5THIQ2F7TR8OHDywIfDsL4JxADi0Pp1lt9ezXrlB1TR/rVuODPr/x6siZ
         w6RlbWlgQtDFgLWfGn3LXVp6LZp8WGP3gne4ktnbuSAgqDT1LO5bCxY8kAgoSacVHZ1S
         5zyVboagovTFDhTuKAXdY17coMTK9s9NRTD69na8VJmLdxjw6z1YrTr/n1m0fZuRi7Cw
         J+ug==
X-Forwarded-Encrypted: i=1; AFNElJ/CBp3pHmXYAc4+2BsO1oO5x32jNNNe/BduGtNXe9ajsWHz15wCY/BOsTQ4P72a+DcBVSTQHdN9uzSWuA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxuK8QdGSGYaU0LmRMxaJPvzkJDMDKQRmckA/uwPVL3o1SfoZaR
	kuvGgKrITYKP+ZNskWpKKbZtVsXi3Lh1uvcN9w41gIy7LlWQAcxoJl3Xg/bbWlAayHA=
X-Gm-Gg: AeBDieuDIY7jB3cglbtyk+UubomVmMg6P9nBTTNFgnX736UZC6GSM0khqAH/G8wmahF
	ro/TWA0Obqsxms4gyD4SE8UMCMh9Q4glJoCo/G/f9HkURsSerw2BjA40HSvJQcY9TImHFug11As
	BBgQI6kfkdVjJP9GSf21KMsXNmJdXhr0ZtCjfwtmlPg8P+fd3yLT8nV9nBXLMnvT3i26LfStteb
	g3bd2VxxDrz2qs09Z5+l/zsLF/rpmlt6JA80XdZ9ewOMU4KvUlMxA5s6hXIr5Z/rkXuD7ays6o1
	Zq8sKi+MgPPpUh0kEbxANIoCiD9og7L5d4kkYW4YfbEK4kSpH0VRFakIObF1omk33lrJ2N+Bhm8
	PusTDrQ/QMU74Q72a20tLVXiwaZK304FF01u6Lzj3JcYFdbsJfQmkcEVt356SHQFXYxlt51ejYJ
	q4QfaI2Q2Z+pGiDkpR/wK91VOP/gRlghdGNNEPjLY7UHzYei7NZwfxBGjuhHSX8GbED2ihYEyYk
	xZBBw==
X-Received: by 2002:a17:90b:4c12:b0:35f:ba8e:150d with SMTP id 98e67ed59e1d1-36140464038mr31761615a91.14.1777014733924;
        Fri, 24 Apr 2026 00:12:13 -0700 (PDT)
Received: from nunu.. (nunu.snu.ac.kr. [147.46.112.82])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-361410b998fsm22318852a91.13.2026.04.24.00.12.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 00:12:13 -0700 (PDT)
From: Jaeyoung Chung <jjy600901@snu.ac.kr>
To: tiwai@suse.de
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	gregkh@linuxfoundation.org,
	byoungyoung@snu.ac.kr,
	eulgyukim@snu.ac.kr
Subject: Re: [BUG] KASAN: slab-use-after-free in ALSA OSS read/poll race
Date: Fri, 24 Apr 2026 16:12:08 +0900
Message-Id: <20260424071208.2388558-1-jjy600901@snu.ac.kr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <87a4ut3dfp.wl-tiwai@suse.de>
References: <20260423145330.210035-1-jjy600901@snu.ac.kr> <87a4ut3dfp.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, Apr 24, 2026 at 12:26 AM Takashi Iwai <tiwai@suse.de> wrote:
>
> Thanks for the report.  I see the point, and IMO, a better fix is to
> protect runtime->oss.trigger access with the mutex.  We can change the
> bit fields to bool as a separate patch, but it shouldn't be considered
> as an ad hoc fix.
>
> Could you submit a proper patch after verifying that it fixes your
> fuzzer?
>
>
> thanks,
>
> Takashi

Hi Takashi,

Thank you for taking a look.

Since we are not very familiar with this subsystem, we are a bit cautious
about preparing a patch ourselves.

If you could suggest a patch or a preferred fix direction, we would be
happy to test it on our reproducer and report the results.

Best,
Jaeyoung
