Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2739232B131
	for <linux-sound@vger.kernel.org>; Wed, 29 Jul 2026 02:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785291121; cv=pass; b=pCun5KC/M6FfgffDjAXJPKgt+yELjZW8OKTNpUibvAZ1w+cKvNhtXTxbZLYQMfd7hX9OpQx5XcU6Kf5jMZmDYKqH+IePiXtPplvVqno3b7X7xgEpoJ4Q8eM0yHCgltazrNxXqQjprQU42yT/RcLSKhUYZdN1wi+G9qfG9FiNN8c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785291121; c=relaxed/simple;
	bh=yHW+4Suq2EGqyHBjA21S3ScnqVZ7cq7dmAuBaixjo2c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DOsdvafeJXkKOq6D3t8AWI37qaZnqKGTikOSfaU6dYbl4WW2juTz9iXVqCCmjPxe2DS4nFnLz8NKqVMKQugfITnFkpCSXXg/sYfkgulk2FXsxK7P/n3bpOa1LRcfyEIhfBxH4XEwcuD5pJPR4h8zPmBVTgT9Rc/C2afRzbn+cfM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DOXeOxd5; arc=pass smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DOXeOxd5"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2d004f135b1so7271815ad.3
        for <linux-sound@vger.kernel.org>; Tue, 28 Jul 2026 19:11:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785291119; cv=none;
        d=google.com; s=arc-20260327;
        b=b5pw1t45Ef5YwfPCfTsIYax63aG6WzM+cYulp2L8Ah/D/MH4XnOWXjI4JzDldzX/lF
         XcmtCFD/ezEKCnzv8AYSGa5+cMdoFzRPBAubTptt0j0iz1fu00n0cg+dEysykgu9cu1E
         suPml8w2/CKM+Lou4Mk1AMM3WF4IUAskqnbNhS1WDQ6ba4hmUsCvAhXtrk+Keyzvg9Ny
         0auKns4nSLph8pdE3b68gUYbEwdsoxMNWLlUxJtOrJiuGSqt905/kQ8s8zy/+xpRy+Wz
         ipsF5nU/h6c7T+GRcaGMnEQ+F2mD1eVcOIQunU3xvTmxV4erUUvjMCyVkuBXZC2ECCJi
         1wEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=yHW+4Suq2EGqyHBjA21S3ScnqVZ7cq7dmAuBaixjo2c=;
        fh=/sEIhBXy+Z4vtCxsMK5jw/TbCHbLJuRPjZlT2mZ4xL4=;
        b=s0CNaID5p5laT/5g+kCgKZqbcQG3oozZXuLlaRyvvVPVyLOwmO7S+qsuoSj8GvtZxQ
         jc1RnsCQVRPwaNnry8aorcCtR9mLUQ9i+puHKQEJUuG10cSdoUyhECRYhtU3/wpThmzV
         i1hPzhSsoVouK80hLd3VJuHBK3JSJdtSrMn6ccJlNsnW8PxG8qfBTsvaKZPTDaoEBUQR
         M/npc7MCEFN1nXfCjeFf67ndC+TdtLhNm5Bqj/k53KhXr4xqD29snl0BrfAczK/zrTdn
         ZJvZ2J7V6lr73LXoIpG+OHj/Wed0Zxa/Mxz74sp5h8aMFmxJOhGM0RlVukup37Xsmi76
         AMRA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785291119; x=1785895919; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yHW+4Suq2EGqyHBjA21S3ScnqVZ7cq7dmAuBaixjo2c=;
        b=DOXeOxd5bZ89xMo+JEPz95vCb2m+DVuHX4iR8AQ4hk8XRD2OqPa5a6MjRJi+0veyRU
         W8UHbeFBcm1qfqGRPaBv35DxrXv7cnC65AuGMNHxjkrXbuLB4VSh2w3q1uBGI0OhmIjm
         wGs8/PS7JF17ZKwJDZdkGsYbnABswSjrcKnwzxlWevrthYU3sgGrUg/DAWGaka0aAJV1
         G/LffL3CjDV82RuXrbH0B1vUNJDIptFviEzbrmuzfAxr2073vHB40CIkHL0XU+H+0vtr
         uX19rFQydp+IS1gQc3vcRv4TW+nZZBLmI3VFCG+6MDDFYmZ1v0CyAfJYX1XJCvymDJdN
         +cHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785291119; x=1785895919;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yHW+4Suq2EGqyHBjA21S3ScnqVZ7cq7dmAuBaixjo2c=;
        b=D/Q6tI9Tlcwzw9tw0niNMs9zTmOJ3jt71ziFf1nJqLXNk5XlqBpC8DKxh3uwUJa27c
         Zo9B6e34YlMiBwzlGt/XOsBzAOK9Yg+jYitUyPE9nHv00xUtuF1uVkxEK7lXupIqvx8N
         LY5bhii0eIuNfbV7Z+YGkg8SmgJ5SPJe+AFdqZHfS7lZFXPNSVCke852u1h7Qbhl4Y3i
         HmYpjoyky+jG74deCmoR5JCL9abamgiL4wMFcVP2UUp8lS/4CkgDF3U74H685R1bcntY
         ZrFMhLHEfK4mAg+ptqbgTIB4rjbmvJeJFb9bS0h3C9Fer0bzFACGr5aob4eGjEopaAO3
         vbLw==
X-Forwarded-Encrypted: i=1; AHgh+RpPBscuWVPcwdJqDLua35ez2Bx+GyV0ewKTgRNAT2LP8+XfDFibccgLno04xENO3Lq7BeCmmxpwO2/EvA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyqyBM8UzENe145B2mnZm2v8sWQQkQx5bL/H8hoT+/X7YMgB8rz
	MelxVHZafbQcDtzapS7Ib9ylIgdQaog7Gsj7u2SEZXZXGE9ZWEXvuIXwiHvEjuPLDfdHu/xIbCJ
	+4xYQ47oWC3AVkbolF6/NQVL6FV/Ezvc=
X-Gm-Gg: AR+sD1385Zw6jAZCyj3KR2lKwVqqqcEWazS4iqg3UkbkzSldLv/bSJBr0ieweKLE+O1
	YiP9kcBWjk3q3tBnLz3QfU8s0aWhtLIEr7cU5kdrJ1RbTiRUD/ywfu0fIv0I7pdbZMojW89FZKx
	dGONHiw3rrCnggGNtAPsuV/NBjO0A43JZaoSgoP2+3ifvZq6GSGmAYryX/Sx4J4F4SpjuuB/02q
	qiwzaMwePq8o5qwla/NmE9nQE88/oGloy2EzKLZSbbgxW+ArTMTOx4AOvJovkI6mWSiBWq1MQsN
	vv5taU/JTO2za3xBlo7wPR3cjDybzN1nlK87YKwaQCM2iedz9nDDRQLPUXNv7S7bVTTWkOd5S4N
	/8EEG64pD4tvHvsqPunlLsbu3t4oBrOFAgVAuLnPDHl5ECGC9RoIWC9bm
X-Received: by 2002:a17:903:1b43:b0:2cf:bf3e:4812 with SMTP id
 d9443c01a7336-2d015ade33fmr52365205ad.2.1785291119368; Tue, 28 Jul 2026
 19:11:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260728081251.23783-1-phucduc.bui@gmail.com> <87zezb7bnw.wl-tiwai@suse.de>
 <CAABR9nGfs65V76G8w4jEdMKtE5o37YqOe1XUqh=o1TLwKJk-Lw@mail.gmail.com> <87wluf7aru.wl-tiwai@suse.de>
In-Reply-To: <87wluf7aru.wl-tiwai@suse.de>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Wed, 29 Jul 2026 09:11:48 +0700
X-Gm-Features: AUfX_mzhDTJHO2N8xW5yl6eEoycUYqOeyFBORoXDZMi2UCFtyeRaCBr6DbQ7TjM
Message-ID: <CAABR9nGy5BDU2Tgze0Yh085K4BoFG5EQfWxUX7hBg33hpwDdjA@mail.gmail.com>
Subject: Re: [PATCH] ALSA: core: Update snd_card_new() documentation
To: Takashi Iwai <tiwai@suse.de>
Cc: cassiogabrielcontato@gmail.com, Takashi Iwai <tiwai@suse.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Kees Cook <kees@kernel.org>, 
	Cezary Rojewski <cezary.rojewski@intel.com>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Takashi-san,

Thank you for your feedback.

> Honestly speaking, I don't care much about it :)
>
> If any, you can resubmit a patch to rephrase the comment from
> kzalloc() to zero-initialization, together with the indent fix.
>

It's a pretty minor change, so I'll leave it for now.
I'm still looking into this area, and if I end up making other changes later,
I'll include this in the same patch.

Best regards,
Phuc
