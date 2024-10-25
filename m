Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5AD941746
	for <linux-sound@vger.kernel.org>; Fri, 25 Oct 2024 01:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729819397; cv=none; b=rd5Y2BywuXfjK/oNi1ZST5tPSeTObEZvNXtu0GR4zXV4bip/qDamQTIgB+x9smHQLoQwDQxuN/wlNZB9Lu8FlGGNDb9aFjoBk6JTn23empjGEc/agBZDfjkYwOEvsDt/1cHDurq0XFHTF1RxoQE1sn2EuFc8uhoXf9FFYgUcYOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729819397; c=relaxed/simple;
	bh=pIz4D5iSfqKhs9u4Ccrwg9Su/Utf2wLMgSechXdBxec=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=erqHLRpa32mrnusliwQ2c1z5G0P58IU1RXf8u4k0boinpgRzlbkyk3ywebxO+lz9UfYhJK5vy/qTdMhIv3N2Q+NvmZuQ3XI5cmK4XNjVwzr9eK/xPcCwNSqZFUy2cr83xBGQNdHrSBqmmAvND9ecRgjCII2+ubuIknGMs6iOMqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=utexas.edu; spf=pass smtp.mailfrom=utexas.edu; dkim=pass (2048-bit key) header.d=utexas.edu header.i=@utexas.edu header.b=sOvFbXkp; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=utexas.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=utexas.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=utexas.edu header.i=@utexas.edu header.b="sOvFbXkp"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-71e6cec7227so1208211b3a.0
        for <linux-sound@vger.kernel.org>; Thu, 24 Oct 2024 18:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=utexas.edu; s=google; t=1729819394; x=1730424194; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pIz4D5iSfqKhs9u4Ccrwg9Su/Utf2wLMgSechXdBxec=;
        b=sOvFbXkpHQ/17upeJKYgTKjYLnXyiKqSJp/UqyrhFi5MMDogTB1677ECmJCw4mcC/x
         KMBLCuQKZGayu1BlGJvSkAEtBRdTYTAjpiIBLb3vu53sCo81e1BF+cMzeWEisNBvC6Jl
         54fdnk3B5cFcpVK2XaQMXF+rx+s4+7/ZYoIIoJXu2cpzSN340q93UzZQvmmyU8MnqNJ3
         jeNOesXs6aADa83q9XCbXSdvKV3UZIV+WNAzvl0rUedWu9Blv1t9nVnFgKgZXUD9CLjL
         ICmTU4TLrljrnf/MZws+8+XgmpBCet45tjoJpgammlCOlVy/Y4HInAGjqkhxJhLovTNi
         +W8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729819394; x=1730424194;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pIz4D5iSfqKhs9u4Ccrwg9Su/Utf2wLMgSechXdBxec=;
        b=hHVcNAMhJdvWYDWxw+NVejTMDQneatzeq+UyQ+24ttNGxx1uuXOptNopBvidMH6l3O
         rGRlHFG/U+rP2WfLEfusHE5IuRq18Kxa9HDcLSWB1WlUXAaXFjVoBywqzx4z7cyCbdL8
         yYQXYT7YpIRMHovFIV5Bp78UvPR1FX+b2yAs32P270rP5V3SmjrlOC2eYUzjtyilCt0d
         DhJPQ3BJpk4oyRpS8XngEstPjPE3Kg4nB4AP8uUMGXcCN6NlOz17d/4iTSmf1mDtn/xL
         jNGeDsVHLi8rENBOJROe5w9I1Eca8vBxeMfQkJQeoSThJycQkFZaG5P4Slrp6MF5ibtP
         4maA==
X-Forwarded-Encrypted: i=1; AJvYcCVEov/+DcebOtPmxcApSWllQ/KX+ytXC0T+4o4TXGYCoEn8AVTvlxzuQgW+MqMPi5rqMzczuBVfJfwHFQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyWBulGf16ctOGDAMZp8sQ4B2lDuCn1VGwhd2SX0PM6iwLD7EWX
	3n47hJiAkLJSpYmfVVWc/de/dV5syTEnIu6hCn2qWS5ikYbgNddd319YazXnAortYOuEURFaFs9
	u56+OW9ZKfM/JUfXIWWGhSh0XL4vhdthjirWLsA==
X-Google-Smtp-Source: AGHT+IHfXyziaUAl/+tK39Ykk3K6biro+i36WzXpNeEaPUEW0LrmKuZryiGvNWdoR4dgyxHgV0gJYhyFSUG2HhmvTZI=
X-Received: by 2002:a05:6a21:70c8:b0:1d3:2923:e37 with SMTP id
 adf61e73a8af0-1d989b4ee3amr4495019637.30.1729819394136; Thu, 24 Oct 2024
 18:23:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAEkK70Tke7UxMEEKgRLMntSYeMqiv0PC8st72VYnBVQD-KcqVw@mail.gmail.com>
 <2024101613-giggling-ceremony-aae7@gregkh> <433b8579-e181-40e6-9eac-815d73993b23@leemhuis.info>
 <87bjzktncb.wl-tiwai@suse.de> <CAEkK70TAk26HFgrz4ZS0jz4T2Eu3LWcG-JD1Ov_2ffMp66oO-g@mail.gmail.com>
 <87cyjzrutw.wl-tiwai@suse.de> <CAEkK70T7NBRA1dZHBwAC7mNeXPo-dby4c7Nn=SYg0vzeHHt-1A@mail.gmail.com>
 <87ttd8jyu3.wl-tiwai@suse.de> <CAEkK70RAWRjRp6_=bSrecSXXMfnepC2P2YriaHUqicv5x5wJWw@mail.gmail.com>
 <87h697jl6c.wl-tiwai@suse.de> <CAEkK70TWL_me58QZXeJSq+=Ry3jA+CgZJttsgAPz1wP7ywqj6A@mail.gmail.com>
 <87ed4akd2a.wl-tiwai@suse.de> <87bjzekcva.wl-tiwai@suse.de>
 <CAEkK70SgwaFNcxni2JUAfz7Ne9a_kdkdLRTOR53uhNzJkBQ3+A@mail.gmail.com>
 <877ca2j60l.wl-tiwai@suse.de> <43fe74e10d1d470e80dc2ae937bc1a43@realtek.com>
 <87ldyh6eyu.wl-tiwai@suse.de> <18d07dccef894f4cb87b78dd548c5bdd@realtek.com>
 <87h6956dgu.wl-tiwai@suse.de> <c47a3841cd554c678a0c5e517dd2ea77@realtek.com>
In-Reply-To: <c47a3841cd554c678a0c5e517dd2ea77@realtek.com>
From: Dean Matthew Menezes <dean.menezes@utexas.edu>
Date: Thu, 24 Oct 2024 20:22:38 -0500
Message-ID: <CAEkK70SojedmjbXB+a+g+Bys=VWCOpxzV5GkuMSkAgA-jR2FpA@mail.gmail.com>
Subject: Re: No sound on speakers X1 Carbon Gen 12
To: Kailang <kailang@realtek.com>
Cc: Takashi Iwai <tiwai@suse.de>, "stable@vger.kernel.org" <stable@vger.kernel.org>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, Linux Sound System <linux-sound@vger.kernel.org>, 
	Greg KH <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

I get the same values for both

axiom /home/dean/linux-6.11.3/sound/pci/hda # hda-verb /dev/snd/hwC0D0
0x5a SET_COEF_INDEX 0x00
nid = 0x5a, verb = 0x500, param = 0x0
value = 0x0
axiom /home/dean/linux-6.11.3/sound/pci/hda # hda-verb /dev/snd/hwC0D0
0x5a SET_PROC_COEF 0x00
nid = 0x5a, verb = 0x400, param = 0x0
value = 0x0

axiom /home/dean # hda-verb /dev/snd/hwC0D0 0x5a SET_COEF_INDEX 0x00
nid = 0x5a, verb = 0x500, param = 0x0
value = 0x0
axiom /home/dean # hda-verb /dev/snd/hwC0D0 0x5a SET_PROC_COEF 0x00
nid = 0x5a, verb = 0x400, param = 0x0
value = 0x0
