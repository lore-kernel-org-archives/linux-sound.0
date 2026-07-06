Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 062323DDDC3
	for <linux-sound@vger.kernel.org>; Mon,  6 Jul 2026 10:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783334812; cv=pass; b=rFe7f+R4BwUtkZzO2y6e8nhdq6rNOIk/bfzzTjsYRlCuxAkkMYkT79Zk16fxX9/Y1a4kkyjHfALCGARdeS+TPbTzeNwR+DMr61bbxBHvx+G2AcME1syXPskyHvs7S4crS9R6DpCOJcXW2zyFr/Kqb/7cqMej5uEaIQHNvghlbJc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783334812; c=relaxed/simple;
	bh=uUIk3kxclfHLCmTIwRsZlNP9+Z44aJAAqLrMNzUY0j0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PKHpZDw190xMhEFsiv2JB/ej3qyO23pTOg9e02vyv8/KCEUod46MlDrsRQ3dyd3oDNqJ9Kxl/6i9YDVkWYRo/o5URVuB04l/WSDqfmX9hfl6FIHWSH6fPuCPF39D+uSBpYZ9U8yHcPD+ne3IcDoNA+0RiMuzNymk973xumpUbrQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gpivuh6M; arc=pass smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gpivuh6M"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3811e59df58so1656875a91.1
        for <linux-sound@vger.kernel.org>; Mon, 06 Jul 2026 03:46:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783334810; cv=none;
        d=google.com; s=arc-20260327;
        b=Ef6+ykO3oLcMnXuL4Wfm61cIYtmVa5zctYZhDIo7khL9lf/v1zeHz50pjIIlxd0z7x
         Hl6Wdglc8cv8hn41zB1XDRTvyud+8QRfiwvVzzmkJs8fVEA2ihllsTBqIbTFrob5Xvb0
         mGYDKWq2jBEIRZErb3TqNlDErXHzPvDa4iJ4sZiJUAFBm3MJZAVPN5FGzP/9C4LKNg1z
         YpvANWrKLTEOFCfvSxRH5fJJuddehwDBZcI6D9n3INmxp3z9krjfg2dWCiMkImYAlRIJ
         SFz5L5SokaMgz/dv+t3eGLpOonEEmxXsYFEbpTCdnFP9Tc2hCTeaEhLMUD9RcKnj8idQ
         peMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=J86H9bXagD00jbr5qUyNUhzQedlVcUlifJq0za2JQfM=;
        fh=8gDyUOFlVXgH/BPKzdB/aFJc3UG8XAK8rxjckbb9MgQ=;
        b=nsA1auLGnLILFfW02mTiuuyIO2hkOK+nWkSZxi5xLh0SHv9fHqhXcUeTx5MXsBlsAg
         L3GPUNO3sr2UITpMLlzcf5GnhnX3c8J63i/vxQFznWVNqwJc0U90cwpz3WTwQjMRpha5
         vmx9SMr+gkrdSMh3MZGX+MwHwH9UzprurpwvsIlbX60NigCsdBfZ2oMixxFEgUuDzPuG
         oCXfEqYtYNnlhjeT0jnRt0zmhfB0HjpAD7CsiniZwbJVzRavAC+hQLDlrZcolNVmCZO3
         xOTnDSba7gQ1dgjpdUCTBh1MAm/dMIf2lhw3XV+v4LYUPNcn/sOyE/GPCi7tLxYcwWoz
         O+Mg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783334810; x=1783939610; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=J86H9bXagD00jbr5qUyNUhzQedlVcUlifJq0za2JQfM=;
        b=Gpivuh6MWi+JfmLTj+I7QGjXwVenE/Kh2lTYl45mxsEAdqy8kIU1oxroiFTv3M+LmS
         BThhcIHS03M55SxUt4uefDMd2rhLpI3amqzVE90Du1lTmWJiyygVNXEbLkKmu1VHQr/o
         +yvJm5X6fF+2mjk+oNub72OYnuJhNHjUrNUF1FbOZOUIbIos8hBKpBToXKIS095giYXn
         pPAiz7wweaYQHUgO3ZdHiILYWZ/xRLTBIqRzLWqeajXbgC4+2LleHUxCL5iAuWB9+AC2
         8HGZVg+KVLTkkz4wule4kWVO2WILyiHj5GAPVEuHnIx057eZtZ4/vxB6L4jU8JlCR+/i
         zRfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783334810; x=1783939610;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J86H9bXagD00jbr5qUyNUhzQedlVcUlifJq0za2JQfM=;
        b=Ox/aeqFuRZfY/lK0DLA5Ymi/yVdZQ22hGyQi80iKsS00DMAADJ6vMnBB6EewIcqu8G
         F8GZiahdpnhwSQxk9qsGrRfA1JBzX+/vnqFpv8n/y/4Y1nhluCaFdcSF25vae3IGb1p4
         2lCnqK3OYmevp2hDZdS5LYw119ZkxxGkP1fn+8MQHSYiIpfnCbNjDtsHBuQ7VwPBhcVt
         b6vQWBBs/0xc4dSm3aCVio5NHeHDGMEfKRuCU9oRP32i7R1eQ2K0rNP4EC7VQqPGJ/8i
         ir9nDAMqi0RB6EHxe62puW+iboydfoOXf/ppIiR72yWolAhMwwRQuZhLq+n6xsWWVT3b
         mPQg==
X-Forwarded-Encrypted: i=1; AHgh+RpdQaSRzX4U/FIlWjymN7JUhIefrPq1qIj1zahpeXshMXYSPPRH104IXDt3MNvmWZakQQxznDFTkkx3DQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzVkmOkmlnTqgOlas5W9ODYYVZj8jvh7ytauMsbT+xeqlmhNWk5
	gCFOrHZp6+ktEmaGCy9fvgPLxXpc1yE6c1ZAq3KuROqhlpJQHuaD/XDGlbhgJRaed4kXaEl+IWQ
	F5wAFRtZuEU8G9UQJXi/a9ZHC/hdi2p0=
X-Gm-Gg: AfdE7clmK9dvhbphyY/OEW20sjd6fr/8mHpZJs9fFvWmHne5/zsdl1+LhVBAX4I8qhy
	WPg3fQR4b53LqekJRuNCsSnxYmWnMxKE1TU00AJ3vuGHzjjvSuvRlu/AdAtLikeRx5noHa62fQ3
	LWFCNo/20uy3n0xLziZQfpNOxh5I1F6rERcAIxZETYnOvH77c8Wfm1+xQIQ6QSddlZOWrj638q/
	3VUmePFockOKCuGYUjh0Bo88FFDpWXrpg1vU8JoMT6P3sDs8zRuOhFDMaeNfFh506/PJE+g/49+
	QfLBq94cYGgYqpFC4sXsksu/8a0=
X-Received: by 2002:a17:90b:5390:b0:37f:eb45:e058 with SMTP id
 98e67ed59e1d1-3829d70cc30mr9250564a91.19.1783334810241; Mon, 06 Jul 2026
 03:46:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260703055355.244898-1-phucduc.bui@gmail.com>
 <20260703055355.244898-14-phucduc.bui@gmail.com> <934f9346-f530-4107-aac3-1cdd2829779c@intel.com>
In-Reply-To: <934f9346-f530-4107-aac3-1cdd2829779c@intel.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 6 Jul 2026 17:46:38 +0700
X-Gm-Features: AVVi8CfcqZEkSIP8omXIyORuxkBiX744iOmSXmoaBR0SsfvMSdawSePMoE-lAFE
Message-ID: <CAABR9nGSRH3DmehUxQVmfJ4Po8TOhfHXDnjjkzVJDZZ1w0_51w@mail.gmail.com>
Subject: Re: [PATCH v2 13/24] ASoC: codecs: cs35l56: Use guard() and PM
 runtime scope helpers
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
	Cheng-Yi Chiang <cychiang@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Benson Leung <bleung@chromium.org>, Richard Fitzgerald <rf@opensource.cirrus.com>, povik+lin@cutebit.org, 
	u.kleine-koenig@baylibre.com, kuninori.morimoto.gx@renesas.com, 
	christian.ehrhardt@codasip.com, Linus Walleij <linusw@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Thorsten Blum <thorsten.blum@linux.dev>, Chris Morgan <macromorgan@hotmail.com>, 
	Dan Carpenter <error27@gmail.com>, Marco Crivellari <marco.crivellari@suse.com>, 
	Rosen Penev <rosenp@gmail.com>, Weidong Wang <wangweidong.a@awinic.com>, 
	Teguh Sobirin <teguh@sobir.in>, Val Packett <val@packett.cool>, Luca Weiss <luca.weiss@fairphone.com>, 
	wangdicheng <wangdicheng@kylinos.cn>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com, 
	chrome-platform@lists.linux.dev, asahi@lists.linux.dev, 
	Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	David Rhodes <david.rhodes@cirrus.com>, Charles Keepax <ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"

Hi Cezary, Richard,

Thanks to both of you for the reviews!

> > -     ret = IRQ_HANDLED;
> > +     return IRQ_HANDLED;
> >
> > -err:
> > -     pm_runtime_put(cs35l56_base->dev);
> > -err_unlock:
> > -     mutex_unlock(&cs35l56_base->irq_lock);
> > -
> > -     return ret;
> >   }
> Nitpick: this will leave a superfluous newline.

You're right. I'll remove the extra blank line.

> It looks like a bug that it checks rv but returns ret.

I'm not sure I fully understand what you meant by that comment. This
conversion preserves the existing behavior, so although checking rv
and returning ret may look a bit odd, I don't think it changes the
behavior or introduces a bug.

> The local ret variable can be deleted.
> Should change all the error returns to directly return IRQ_NONE.

As you suggested,
I'll remove the ret variable entirely and return IRQ_NONE /
IRQ_HANDLED directly.

Best regards,
Phuc
