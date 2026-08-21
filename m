Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA7533CEB0
	for <linux-sound@vger.kernel.org>; Fri, 21 Aug 2026 13:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787319590; cv=pass; b=SO0iBBtrXLyGg1jhV9aAwzWgRCrNcY93lWEeVSNyPIRFgbXL5kHlUn/6dsTBkWn53hOn08pY/JgaJZ8kmia5h+rB5Y1shxfP7bFQpvGMO7UquFSp5WiOei2JedDg+S7NNFEMHGATO8rL0PuItJY7wR+u9z4nC824lZqRJy2HjFE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787319590; c=relaxed/simple;
	bh=t+HdcbZ+oYnxqa233Sx9hBRsHHzyCOKwYq7ffek24z0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qtf29edslaXMGPBMF0z4SsnhwOJm5H9Z908umxSqMTWadElsCDnIGTZp8/tz5DzcmB0s9iIkTUXxb0HkQ7S+j8Cwbeo5uZnovDiSVs3yB6X/lHqfeueY/uf3YxNQqERHQcB6xVjLisWnfCmztugA4Cn597aTWnBHa3VS2pd3I5Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=asseily.com; spf=pass smtp.mailfrom=asseily.com; dkim=pass (2048-bit key) header.d=asseily.com header.i=@asseily.com header.b=j1D2Kkqq; arc=pass smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=asseily.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asseily.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asseily.com header.i=@asseily.com header.b="j1D2Kkqq"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-8111c0c7561so15448187b3.3
        for <linux-sound@vger.kernel.org>; Fri, 21 Aug 2026 06:39:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787319587; cv=none;
        d=google.com; s=arc-20260327;
        b=rFgl2XPl/vii1XCPIjHR/un0aBj9mdokvRSXj3/mulRSbP70Tu3z+xqeyrJ+jh2Na8
         KWs37iyXEm0APOaCQwuBbPCJU41S46zBBDLWmurYCrzUPVIlK+0YSsXaR0glXc5VE4dt
         jfnHl1GkuIiVQD25Hn/nZ9N3fwGKFqHBuEGck6B1/8Kr31HYUoY8BRYRqMlaCSTbiGBd
         9gliZEcUBORbe5z8eTALtMJMk13dr48YqUFCEhDUEmQLfiPn+2nkyKKg0FLtE0zfWnhS
         SmZAZKTLoCUJqJmIUmwIbqzYwRK/D82yVvdoAykFOf/3VRSIicfg9ntlfqnB56Sydf0Y
         yKIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=8fx9EwVxpWHXqzotlrMOOBGlJybxpxQagNiOTJaiuZk=;
        fh=uMgjJV7ZVQAteeMKmx0v2z1hdh+I6+A8RD64ZnibE14=;
        b=lPyqENgB1WOGEpy8SNXU9c30efJB6D31kVtRPGDLCxC87kBMD/htjJIufNpoqIrtFg
         0E2OHbeomZ1C7hWWzOzO5ZQNbUiIacrkS0tF05O/aSDsKwWFQDZWDF23pZKagf+kIwK6
         SqC5Xrx9pWN9WnJoQQ6No1LQzNmmeXX0LDsAh1OzF/sUf8UMTy1aavs5ooxo09ouDkDL
         YKPV65LjLc0J14CpR5KktBHIZwQ1BXNXBJtADWC8gQvURjasiyrx0l8/5IuaeYQKQnqc
         Ny55lL2dXl9BKB691Mvu+UyKFWWa/dlET4SC3SUQbC97eVZuORdhj+oAsB+hauQBCdBt
         bpEQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asseily.com; s=google; t=1787319587; x=1787924387; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8fx9EwVxpWHXqzotlrMOOBGlJybxpxQagNiOTJaiuZk=;
        b=j1D2KkqqXGfMq7L3EQXv5rbabkUl9ftzBa7kYoDJvP/uDlIJc/x3ZFReyu2oHAdjyM
         PhLDC5ndnRo1hHv8lqkRxzrSNTXX27DTg9DiT3FmOyQk/JUqMLVjCTFlJEFZeMmwRhj9
         sIJIbR/v9Ofd6PfxUUce2fOuoSQ4WURqX14e53XXzmdaLSg6dKGp4mnQdRMpef+CwlWT
         k9ZLlQJBavnc23xS9Q0ctrukjS6gDwssOWqqMD31PY/KO5mhfHP/s2EU0pIztvOu1g4g
         qVmzT/NjcbGJi7o6n2gweGmsnJftaoadHrUDYcZJSOcCup6wPsIPgokQjXMIATk7J0a7
         HtgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787319587; x=1787924387;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8fx9EwVxpWHXqzotlrMOOBGlJybxpxQagNiOTJaiuZk=;
        b=CPb5Z6LNE7IZ0Y9+If6Dq0+sTepSqLxnZl4gZV4PTfF8pbq1Jcc9w+S3tTOACZWHf6
         mMQOeD165+inFIULGrCi5E1nYGpAcivqI9zDMHi5kPLpLF/LgRoITKZcb3ydWTRJl7n8
         zlclm8CvoNyvhgt8VHyeW+RR09zbxAWMrpJElVuzRQcVrzadngekeI15LaPD4fOJ2r68
         4Y7ty0bn5so60LtQgOaBr/bbC5CPTJOt0UjjBq+Otm099MnkhvnxcDbzfynYddHQf2iE
         GckJ1aYLTp6HZFVtMvwMA2hPxTbfmsu/pIY9Q/POZaWEFcOu4aX2zKPSOM99K6YVzv8r
         ITAg==
X-Gm-Message-State: AFuF++lw8W6IcFqvTrMfLj4PQYwZPHnduIblxISg0se+FeTXpEtv2qFg
	t9+tljj0PINZKHUDcSYx0n46tHqkE9DJ8F3NAPMNCwY4swSmJpp1DcFbeM0o2a3zqjO9X94cfkV
	2tFh+hIJy/9RHhzF61S/0jmr+NGiU3Lob3E6jJcbJZg==
X-Gm-Gg: AR+sD10isr2H9jE474t536ojA75LCGPvBspeZaNbl4u5tMl0+BDIw1302zjevSozV7i
	6ZVQ+xVnTnhYv9yBD1hndwQU4zvEBTGYN4WK7eD2o6S2rexOREpVkBPVEJcxJ8YOaVIbPCnc6MQ
	LEGPSTpfQ7JCAzTf+1Q82oynv68Sw3MMMYx4yJ4Tdu4an0Fy/nCbkrNe8DY8cehfwTURA/ccqdr
	YLwXVDSCxxTCv/i6Xk3agnNhtUXFGvoFhqjQV2MXn2IyTNdpYJNSJaj2UKjUYtbUIv6epptchSp
	w108UeUFxcGo5F5GWwYoCFOZRcwIheUatczfXiCBSXeQN5DUcJm7zyZHtgFUyQes6Lro7m2+w/q
	CX2Y=
X-Received: by 2002:a05:690c:c61a:b0:809:fd83:a88b with SMTP id
 00721157ae682-849f090e374mr21903827b3.3.1787319587532; Fri, 21 Aug 2026
 06:39:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821043859.171871-1-karl@asseily.com>
In-Reply-To: <20260821043859.171871-1-karl@asseily.com>
From: Karl Asseily <karl@asseily.com>
Date: Fri, 21 Aug 2026 16:39:36 +0300
X-Gm-Features: AcwNN1XnB_07CHskhgE2GtNqX7QkrB6ibl28GsQFbygwH8zOqjiTmcBWKkGttJQ
Message-ID: <CA+gvwbomK1Vr4nXnFYa-g8PgVCisoQG8fJB_QpSHKU=GVDZa9A@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] ASoC: add ESS Technology ES9039Q2M codec driver
To: Mark Brown <broonie@kernel.org>, lgirdwood@gmail.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, perex@perex.cz, tiwai@suse.com
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Two problems in the clocking rework, both flagged by the Sashiko review
bot on the devicetree side of this thread and both correct, so please do
not apply the series as it stands.

  - es9039_setup_clocking() calls clk_set_rate() for 256 * FS
    unconditionally. That is above the part's 50 MHz MCLK maximum for
    anything over 192 kHz, and the rate clk_get_rate() returns is not
    re-checked against it.

  - The 128 * FS floor is applied regardless of 64FS mode, which the
    datasheet puts at 64 * FS. Since 128 * 768000 is 98.304 MHz, the
    768 kHz advertised in SNDRV_PCM_RATE_8000_768000 cannot be reached
    at all.

Both are fixed in my tree, along with the mute and DoP controls moving their
shadow state before the I2C write rather than after it. I will hold v3
until the binding has had a review rather than resending straight away.

Karl
