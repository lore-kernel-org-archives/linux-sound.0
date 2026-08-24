Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 146A929B77E
	for <linux-sound@vger.kernel.org>; Mon, 24 Aug 2026 20:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787603481; cv=pass; b=OX3p8FLeLv/h5zVqwL0h/9dbKdv6A96uIPBrX1xJ15sjRScLMdZo0HG3UxljOXBXfNgRyduG6eK696yGoP+NtyLnwCo1l3U6M3UF2b/Sw0Ke3RWjcYtPzQjg2eosGMJFWyXuYNQ/jdvwlyb7pNuk12VKKldbbqw6O+5qpX4YZRM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787603481; c=relaxed/simple;
	bh=BdqbJq/msOBCkkDUN/S0Xt6oyVT9dXF1dmGv+lvM+gQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VI85KjEwKT6xdYku9uI+rhjMHgTMcGhCmQ+pbvcBjOrUvsVMVcm6JtX8wq0cGe6tczSayENccKQj8+Cl8rs3aNia23ODGkkz2dL2cGymdj6eR+HLnB6svr07pJ1V2H96ghw6ZYF6YJljVLzN+5TxhpGDcxkC6xxDyusXhefSXHw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nWlqgbfC; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nWlqgbfC"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6a41191c9a9so7863398a12.3
        for <linux-sound@vger.kernel.org>; Mon, 24 Aug 2026 13:31:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787603478; cv=none;
        d=google.com; s=arc-20260327;
        b=HLmNzOoqohB57zKRe0F5X4zR6fcnYwUTmV/iWUa9yK/qeGOLxWR72pXuLkNgYcgBBy
         fiM2H7bY0r/T8S9AxQzTm+M629XYSPIVxjd8pOnywCyMOiLpVYTtw2w6GELfHFCfy9pX
         mqpAXMA59DMDLojWBP9S6ACm2y94VMVl75sQIErOE5lJ1atum9I9ectIPWe/684SIZhW
         bDFL0k/JgPMU/xHOH7wv/MxarTcaw9a7gKsgOdJFNpO8RlJOw/Fg/vekJTO8EtJ58MT6
         MGvZBgSgUe2b4IKEHQjWuGs6+ZXDGzqjHALxLSf6/mnhPi+Fc3n21uipSllVaWnoYXO0
         GHTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BdqbJq/msOBCkkDUN/S0Xt6oyVT9dXF1dmGv+lvM+gQ=;
        fh=IQsWyj/0e/Asg2crSMfb8kbZxTNGaXw+MgPA2sexFyg=;
        b=Wt+ubsldjbZuQInQy2zW7eB/U+lKLKv537Ej7a/EP7AyLu0F8wA3Su9G9Osn91XuVK
         kIAOV0M79H293kvqJyKPOq/sD8KHNzkj3C00dOFz8MI2GXcFqQUclW+VbmHSPwnGLTEG
         sZNEGjMLu4ERD+qaDaBRwtTtcPaQbGuMdt7diZa8Tu9LWJSdOCkpbqQ/EhcGvUoUnXg8
         URBbnGRTothPrtzLmXs8ciACiNXwrpGPFHFRecyVXwdDy5J6vdOoq9+RKWYUu7TY8dip
         Q8CidU+vTnX9UCKCJZC4JMBTobJPw/bs8YsAQceDV1ddfLkWw10ueILvP0XPq83+gxsW
         snoQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787603478; x=1788208278; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BdqbJq/msOBCkkDUN/S0Xt6oyVT9dXF1dmGv+lvM+gQ=;
        b=nWlqgbfCUk4i14/HFADUqn5jwOTG1QRMMp4Tq1+lIxPVntK5r+Oh/L7R35RrIocWYt
         2cyyNyj2K8DBIz1Sree1Qx4Pbj0HcuXsCs0KdiNNuMAoxvkSbmr6pEJmbnzJHGOqrf5E
         59WKZlY6pfS7I/siOFDeV3ufWKJtGh0MVX3UCn5m1mCXnanfkGli/uomJkx+3NSMt7fd
         ktktZF+tcbyyguMO+QOAOCL1xPwGZoo+5bPn03opV9tHI6EqfPjRdCp98VRGstSS+vPr
         6sWoi6Ra4dKyokxOGLzfw7WWV5Ao7Rwx7khw90jS3Luiw+Z/AGNO0/LWxWXH2wobLVp7
         xq2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787603478; x=1788208278;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BdqbJq/msOBCkkDUN/S0Xt6oyVT9dXF1dmGv+lvM+gQ=;
        b=aBrSDY88jLsmtUQxHWYQM9bit3l+1dD26uDZRzelrW8Iw0wr9AvjCp+bOYOuuhXXhK
         YZp6zCgRPBLzQIHiKD2QhqZ0y6Lv5HbWrqERiuZhAoHi6ABrKuidjl6Tr8gq5D1HgxZ0
         ovTce5NO9oyAaFzcrggQ00BnrdNFE4lrfwUfVcmm/jyaxFG63k3znUAmCHcGaooIX1FF
         x22W5N1gGw+HrqJOExx3jvcpoLWJqsHKMS+nfi2Z1TLA4wvR609PoU8N55aOVDy/U/Xz
         Pr5PtBfVr7KkffNL5A7mewtUiGRsTKD+vWbqlHo21WA+/JV+bJ8+lmPXKeH9ERtX7FHS
         bp9Q==
X-Gm-Message-State: AFuF++kekME5plT5WrSUQxz8/PVVESV2BcfD1V/QPp/4gXAcpQSdxYxF
	5oSPmUVVhAOzO2Udjw1IBOAlRsC4YpvaEv+3YwNeuqoX2AaUP6SVSmBVMObpPtcK2vCpMckI27E
	hT/WQ95gozFn90sYmRq+I47bgxWnYFqg=
X-Gm-Gg: AR+sD1025PaZyRgSEI0m7LxBIozsxCsdMQFZ6C+91s/95m51ILkCFvm8yM/OrFdUMQ9
	54faKmGMwV13f9mae3o4/uHHhUdKaoNOWfti+TSd7XpDz427i5QRQB+rN37gJe2VOzxjeR1sUPX
	lCuq2kqp0qcOxj8TCwkVz8hAVOJwIZdPfw4qoc/WHw+VAfawxpC6D5bjTnqPaMQ+5nPVqyN/EPx
	UD9PZjncy+H4nVCvd2yuhKcQSHG9SyQIY18Aw7aK3vM8YSa21Z1llKzXOarf8W/FvyEeYCO4o9T
	S5HeocvSVyUSSKi6TRIE0zc+HOS8XK/Jt1GsLct2E6tJ4SfBYsEaxIi2nF069kHc3beGQrg2pAV
	UPg7rrb/oOmmJnBE/N+1a4DVaQjnIgIe/h+2SxprQOe9Lwlp15Jp08hslKGq6eFgUpAywBw5dfm
	sjBW1BHXpTu+B62Np/I/AjJuE24bMsn0Px6LPRgcX5JEqnK5tZfAre+Yga
X-Received: by 2002:a05:6402:1906:b0:6a1:f8ad:6c0c with SMTP id
 4fb4d7f45d1cf-6a42f1fce20mr35518310a12.16.1787603478279; Mon, 24 Aug 2026
 13:31:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260823050012.17067-1-rosenp@gmail.com> <219e4bf6-f7c2-4651-b032-e9b1ea11feab@sirena.org.uk>
In-Reply-To: <219e4bf6-f7c2-4651-b032-e9b1ea11feab@sirena.org.uk>
From: Rosen Penev <rosenp@gmail.com>
Date: Mon, 24 Aug 2026 13:31:07 -0700
X-Gm-Features: AcwNN1Xu99UHBB5ytUNfFVDP-9LDqFJzbdzdqQIBKkcj-I4Wbr-XxYcud_LSSAE
Message-ID: <CAKxU2N_Jt2kfV0mpLTa7s8sEYBgk=2L8_SvdRPWjgf-_QMtEnA@mail.gmail.com>
Subject: Re: [PATCHv4] ASoC: xilinx: formatter_pcm: use more devm in probe
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Michal Simek <michal.simek@amd.com>, 
	"moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 24, 2026 at 4:41=E2=80=AFAM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Sat, Aug 22, 2026 at 10:00:12PM -0700, Rosen Penev wrote:
> > Use devm_clk_get_enabled() to let the clock be enabled automatically
> > and cleaned up on unbind, dropping the manual clk_prepare_enable() and
> > clk_disable_unprepare() calls in probe and remove. As a result, move th=
e
> > clk struct member into probe, which is the only place it's used.
>
> This doesn't apply against current code, please check and resend.
I resent a version that I checked against master as well as linux-next.
