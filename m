Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C5D3F5BD6
	for <linux-sound@vger.kernel.org>; Thu,  6 Aug 2026 10:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786012402; cv=pass; b=K85WAiQnyasTzS4BRwbhYvDl0nAc3MobPCXD4j4nSb8+atYJAoAPv03iZzkQZcOkf7BUp+T060oM+HDrCVnymQWFtagTCPlcgraw3lU/3cCdrZmoUhTb9CRSGYuYoktz76ERDzEYgH0yvzZ6MVZMyGD+NfngAcbAf9T6lWETQCM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786012402; c=relaxed/simple;
	bh=MhxpC1RiQz80rHHK008fiSrO8qNz1Ph79eRrr52KB6s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z8kzRXxO1nrI1NzBJuNXFEPdFY8bXybvfd/ZWBtQxTZX5R9Iql9UKQhlQZAitYzUauq+ALI0MOs/DBhuL/S1DYVKlIq2geCZR3uhVI1Zda/S4Fl8R/2NChdcjP+8gFFCCejj4D3b7/3vLzdxrHKPxGfKurT5HJWsKxypUX5fp+I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YVWFGJun; arc=pass smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YVWFGJun"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-5276d598b96so10460471cf.3
        for <linux-sound@vger.kernel.org>; Thu, 06 Aug 2026 03:33:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786012400; cv=none;
        d=google.com; s=arc-20260327;
        b=eTTyl+r8YQq906P6rYBvi4d9ynlR2KNp9qNGBaV8RzvhKDsPp9IekS7+jiOJfuZI+A
         RC7di+ceM2x27GY83ryYx9usbBegRIFWa9cTD5NBUpa/YCdFPm4wU4cRpsoIvkkUEUn6
         ldYCay52ICdYThUTGjuLMf866ksv+fWWt7VnmUSc7nEuNDCUTXH6NLNTI8iG0e9RbF7n
         wqCK1kAFQex7hMq/LUYDYvOnW2sd9V9IcfRVOb7B7/6VXLaXfpPKS70C3QQhYEPBsi8c
         ZnStrGcXTmxOOj3Tc6cJPib+rPQewcfmjkwZot7dPVDyrvNom0VRPcv66WE7xsOaMp8o
         oQHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3TbJec+AGct5ToiNCUExgxyz37rxNVU9OlXe/UQfwS0=;
        fh=7A+gO6X8fxA0urfhP/DliltIyU/P+YpDbfCC1h9pX4Y=;
        b=holDmo0CF9LrU1v7YhIbEyvwwgzo8xjVL6O8LFHXwx51piS+68nGWD0S5GUDMWdONn
         c2yNyVBnmecJT1G5hIzlLdoX8bYPFWsSPjkCS551scZQmToiUOoNJf4JKUhx1+n79fPn
         iiejrs0Ugohcux8/0ZytH9ATfxbOaq7BU2DtJAN5TJzRE91AmLGxA2MYThAjkWkR6HLG
         9DwJU88eZEKfvWQn1X6T0yydSOJZybfM1R6FpZfqtHCe1MiyJQYU6cPPN91uuU4/QU3Y
         kJxbItrV20MXEnQxeJmty3if3mEPQBbuouzgxVmb82kHSJodsgtnx8luyrkvRcZ+4dRF
         JX8A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786012400; x=1786617200; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3TbJec+AGct5ToiNCUExgxyz37rxNVU9OlXe/UQfwS0=;
        b=YVWFGJunLGTxSynKfFG+mgyy05X85Ssdj3LzXyCMvkCNwBg+pbgdC1LxjEjkxQUQTu
         8+uN2+aTFp6y/PpATkByucKIqv78V6n1Y6xw7ZRuaAEibyhft0fRjb2KZl/m/dAl/Wg1
         BybzSzWi+3St5dDiwUGqX+FCotDIn3UYvywALDccQNLXvbNHepIMfc15LaJR+xYDgDpb
         lGXB61AZ2ow/Vm16JmuxrLYtNBk4mOF4Nb4exmmnqQnTr3hVxi5WEksJ5Y8nTp+E7d5s
         /OEQ+zcV/FWQ6tSbXrROXoy3qcBBDS/TmccfrfgDk4aftbhKqg7xB2tiMR/vHncxoNcZ
         O2xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786012400; x=1786617200;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3TbJec+AGct5ToiNCUExgxyz37rxNVU9OlXe/UQfwS0=;
        b=cl70ZyNxmHHoCdopyf0QLwoYAsPyGGSA1FCiYS7lLCuWO/qidrzyZrzo2MUBVg9QCc
         e6IRYu6Q1bQDney0FccaU9p9+IqPkpncr58rS2KFWCjkalyYpjHfm3BuSK+rF88o8Bt9
         CzLa+uOh8J7vclbvY3jkcZV+ovSh+KcfgQjakJVJFai6wvYlQIeU0jgRl5IGkrQaFZnH
         pcyt4gwlNbft80NQ9LUkKUugz9dY7QZ2mOSidw9S7ZxMuSXHxBH0qFAtVZE00vS6wDwR
         6yvrM5EN0YKFFCbjXgPDrEkmH3igU26UYlK7is8/528R7AvQ6LbZYbWlhqhlDsrlcfy7
         Iouw==
X-Gm-Message-State: AOJu0YyBNCBeGBNjTBSciPq6Y+OY57GwHGi6pNQ07ukBkgdQlaxi6vfj
	LWbh0iwrAPJjimMyfa+4Q3f4BmW0Q9dIhdDZ3bWao2fIFQHoJ1KPApLYNX7xVKVU67DfoCoOatf
	nPViA1LzT+Bs06utg49GlcYMuObT2MlI=
X-Gm-Gg: AR+sD10weAb4YU8gbGlnGkUJ5Tea+ieHMWO4PkeGLV31dUh5KE36+U++lYHbExzDEMS
	b4C/e8wvkKCKH0ybc0l4MqKseE0hp1Rjq+xgQVMk+bEJk8n4BV7B20zb1XY2B7HtCl8OG+Ypjtg
	ebrSNVzecaDkE/XUX6OyphJlScnf43l+b5jsbOrNMEDmpdsalsSzUMHyvEgBku8NqFECHXRnRUw
	2h2qAWe3+DS6b2hsAl/XXaBq8Bk1surUAWDRJIjiA2ctsb5wPmOtqwagb9Hd8v/iU2mF8JGgXnX
	FIG6MSKXUv8LD6LxUZICpVfQTsYFIiiK2lDu3bdcaEDsJN+W8Bl0/A53cv/7uwvIoY2MMEShePb
	bEQ==
X-Received: by 2002:ac8:7c4b:0:b0:51c:f3:34df with SMTP id d75a77b69052e-52ce61b5dfbmr128479761cf.30.1786012399807;
 Thu, 06 Aug 2026 03:33:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAEQ1D3kdA3mkQx7ei9Kq0gwky0qroJqCLKrkvgfkqgTbeu086A@mail.gmail.com>
 <871pcbg3wr.wl-tiwai@suse.de>
In-Reply-To: <871pcbg3wr.wl-tiwai@suse.de>
From: Gert Burger <gertburger@gmail.com>
Date: Thu, 6 Aug 2026 11:33:07 +0100
X-Gm-Features: AUfX_mxt4kDB4mldVeOy65_r-8cVF9zaHbjTtpOatqg1doG2ROIDL_QpomGKz38
Message-ID: <CAEQ1D3ky_7+g6_1J7ymxGUq4DNrPyx8OCsQ8Z42j2-XncMW8ZQ@mail.gmail.com>
Subject: Re: [REGRESSION] snd-usb-audio: SteelSeries Arctis Nova 5 mixer
 controls disabled as sticky
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, 6 Aug 2026 at 07:27, Takashi Iwai <tiwai@suse.de> wrote:
>
> On Wed, 05 Aug 2026 17:41:27 +0200,
> Gert Burger wrote:
> >
> >
> > On archlinux, after I upgraded to kernel 7.1.5-arch1-2, the sound volume is
> > significantly lower and seems to lack bass.
> >
> > Reported by someone else here:
> > https://bbs.archlinux.org/viewtopic.php?id=314220
> >
> > Previous kernel was 7.0.14.arch1-1 (working)
> >
> > Attached is also-info.sh for 7.1.5-arch1-2 (broken) and 6.18.41-1-lts (as a
> > workaround I installed an lts kernel, works)
> >
> > Device:
> > Bus 005 Device 003: ID 1038:2232 SteelSeries ApS SteelSeries Arctis Nova 5
> >
> > Dmesg diff:
> > Aug 05 16:22:19 framework kernel: usb 5-1.1: 9:0: sticky mixer values (-19712/
> > 0/256 => 0), disabling
> > Aug 05 16:22:19 framework kernel: usb 5-1.1: 10:0: sticky mixer values (-21248
> > /0/256 => 0), disabling
> >
> > Can I need to provide anything else?
>
> Could you try 7.2 kernel?  I guess it's still broken, but then try to
> pass the option "quirk_flags=1038:2232:mixer_get_cur_broken" to
> snd-usb-audio module and retest?
>

I tested with the `linux-mainline` package, currently on version 7.2rc5-1

# cat /etc/modprobe.d/snd-usb-audio.conf
options snd-usb-audio quirk_flags=1038:2232:mixer_get_cur_broken

That seems to have "fixed" it.

Thanks for the tip!

Cheers
Gert Burger
