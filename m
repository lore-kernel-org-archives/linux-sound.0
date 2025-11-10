Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A1227A107
	for <linux-sound@vger.kernel.org>; Mon, 10 Nov 2025 20:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762805428; cv=none; b=WJ3ojfspEeGPweIU1Pj4t/tGWtTeB2FFm4PgKdk1/Xg50SRgIoKzBQ7YxiaeEGx26vqHeIk0VTPNBHJb2VujTcWDOUR3WtkZhJOREImDfsl8txelgslMFlYhrhrw8uNgoEBOvm9g/lbQZEic2+YvzNmqN5V/Ld2MMjo/r4O07fE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762805428; c=relaxed/simple;
	bh=9jh715J3zhYgr7vV+A0FRNJLn3+kp5U4RcDiOVM26r4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FNTyXFy9kW4wKCZs33fok3d4KHgxbnYBSMMBCLRLAUY0QF0bVpiSYw4nTJewT/ueRd0lfYARmQ+CRWY9AELCKGs78ttV3JkLB+gyS39GvALRxiLqEQwJOsYtOUT8Kq4B6Q1y0+4xcpiU8Vtu52BKxkvRJrvv8sQcZmdVXm8Zaf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=PWiLgpM1; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="PWiLgpM1"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4ed66b5abf7so1393461cf.1
        for <linux-sound@vger.kernel.org>; Mon, 10 Nov 2025 12:10:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1762805426; x=1763410226; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=i1l1rpdi0edG+jJ2v9QDv3ez8ceen+pVk5UIQhPyIEc=;
        b=PWiLgpM1Xj1hcc/Diykff9tkLedp9HlEv2Ndy6lA+4MhX86FsY8YwrnCd4/m0Dw5BO
         cNb/SahwoaQMJvfa33bjgNLyIYNvhXoN4qBdFN5Ybka8zWkXEo42XY+HgtfaVbESChnq
         ZkPHkpfnmbNB29sCKLi28yUzjivvAIDLyrVhGjdg2yYo3YLn5QswSXnWLzMKS97QZ5Ga
         9rhdDCAjmtVfFZzsuBRLJ+mPIXVuYp0NhKA6Rw+2eeemhtP2I261YzuWKQvKBZtYZPo4
         hTQTljymK2z5UxSsc+LCwUU7lrESGNtBLWQt7OGhTGWouLpbEgVhwAAMhegpetzKUT/k
         a+rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762805426; x=1763410226;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i1l1rpdi0edG+jJ2v9QDv3ez8ceen+pVk5UIQhPyIEc=;
        b=DV/Oj/9leZZK9ohILrTTTqeeel91Kd3/36tDxXwg2LhyXLft+YpASN1RjklQy3GSu7
         aAZK6eisO/IYpNSiHZDdvc/BMIfbFl8Ob6sNJQhDZJGaim9bPYSvbdt4OJX/xcy6lEHq
         FxFtsve8pZqN4xBOfUzxYErwCPgh+VcluWvKLfuXSbeo1tA0WTa8wq1hrzGInwNlTTdh
         Z4OtUPToAQ/+NCtU3M7U2zfY7wY51imLSsVAtX5EtB9sv1ehKpt8WKAEwUkDaS1WTxMq
         6h7LdwXsPNA0PaTFHn8cWAbU04m2o3oXJP5a+m562UNBVlMaohdzQKfsz7G32pAsQo8e
         4E3Q==
X-Forwarded-Encrypted: i=1; AJvYcCX7j/H5f9HCkumUBES3YM4Cgda5WXIi5Pp7YQu67gwfle9MyhbKuGzOnwiYcU4cRaFtt8xpjgPx7N8Yhw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+YlH09jBAt8W0mTffn/l270Manp7TdiwyDmnkSeGod4kdR0Bs
	Ph+1JTDZJ+Yf3c6NmdJijxSCkevkbWZXODpYsGY4XoZfh/tDCALPJPoGMNWeALdrH5a/Tt7vE4K
	/2wYCOw==
X-Gm-Gg: ASbGncsQXcWmKJhIBbxj/AIfpPCO7L/9+nyzCAkyP/fVzf89UlyYOMxNBXQGmFJoJji
	80JPk/Y1yN06AyPyCImzTx+3erS1sAD7o8scomKd8Lr3e2D1b+gqzKayL3OzqtbgiW43/9YYK0Q
	pt6qF3qEUHSa1NMKkeIZx9h+g0AxrTcKm8wVy/lTzqiBtHNIsiiLVt3wlF4p9zNFteY3Qo3QrRM
	9rqfb6sO1y+MoN6c2mXp8LtQVFNj5JzpqpCFHL7vVsCF0xo+LN1X91M596PwLMJcttp2C4g4sjX
	TzE/A7BuxoNLbxmJSDuOBr/0qG+C9f/19e1tJCPFrm1PnNvWz4Yphs0wEuu3QEJYUc3cN/4O/1X
	IdTDQSjcCAIzfnbuRH0WSzchd9R2gv2ZrNNJfDeKDLAjnVrmGrf05IN6DMN/WrRAQwzng25Ij/2
	FzdfcyiTbUWbxx9yO0pemM0e3jdHHkeGcVm3bdMbNxlv+jfYiZfr0H7YLX6yQkSZpxMMzSqw==
X-Google-Smtp-Source: AGHT+IE6vW1fZ0H1TK1sGq2X+CuEOdqFfcqY7kVDqldDW7KHCD//2cXzu8s4xuuaBFfozryysnDJFQ==
X-Received: by 2002:a05:622a:5445:b0:4d1:c31e:1cc8 with SMTP id d75a77b69052e-4edcab19f1emr6309711cf.22.1762805425906;
        Mon, 10 Nov 2025 12:10:25 -0800 (PST)
Received: from rowland.harvard.edu (nat-65-112-8-28.harvard-secure.wrls.harvard.edu. [65.112.8.28])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4eda561a021sm53507261cf.1.2025.11.10.12.10.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 12:10:25 -0800 (PST)
Date: Mon, 10 Nov 2025 15:10:22 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Terry Junge <linuxhid@cosmicgizmosystems.com>
Cc: The-Luga <lugathe2@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Michal Pecio <michal.pecio@gmail.com>,
	Terry Junge <linuxsound@cosmicgizmosystems.com>,
	linux-sound@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-input@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Subject: Re: [BUG] Edifier QR30 (2d99:a101, Jieli Technology) reboots itself
 when RGB brightness button is used under Linux
Message-ID: <1ac9d1dd-822a-487a-bd42-45c163dfbfe7@rowland.harvard.edu>
References: <25f2419a-ee91-41eb-9446-87d238b4c7c4@rowland.harvard.edu>
 <CALvgqEBu_RzQYRSJnbu58XZt5wHX6PRD8i-J7Tovh7+KuhOyag@mail.gmail.com>
 <6999b5b2-a242-432e-8100-5d8ee58bcae8@rowland.harvard.edu>
 <CALvgqEBD05PwMpm00cAbFkpSWpCFP9jaBU0r-8+op+RGPtkktg@mail.gmail.com>
 <7adc816d-169d-4213-bb67-9d070af3c4a7@cosmicgizmosystems.com>
 <30528153-95f1-4ec7-a6bf-5da396441f86@rowland.harvard.edu>
 <xrfmda5rohporc3bjax35fc7xjziai6cmdt5svjak5rps6y6jz@k6h4zlt3jgg2>
 <CALvgqEDZ=g+uvdSYqbD22sL_VP+n6Pda2xXuFAJyKkh3bjm6HQ@mail.gmail.com>
 <CALvgqEC6UW96NEYOCM5v0m4x8Si0A7AwPuMpwXt3PMqkO3eqww@mail.gmail.com>
 <52fc4350-2930-44d3-b844-03f00806f142@cosmicgizmosystems.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <52fc4350-2930-44d3-b844-03f00806f142@cosmicgizmosystems.com>

On Mon, Nov 10, 2025 at 11:57:10AM -0800, Terry Junge wrote:
> 
> 
> On 11/9/2025 10:54 PM, The-Luga wrote:
> > PROBLEM IDENTIFIED AND SOLVED (almost)
> > 
> > Reading this: https://docs.kernel.org/hid/hidintro.html
> > and https://github.com/torvalds/linux/blob/master/drivers/hid/hid-quirks.c
> > 
> > I decided to try the HID_QUIRK_NO_IGNORE:
> > 
> > I added to my kernel cmdline:
> > 
> > usbhid.quirks=0x2d99:0xa101:0x400
> 
> Are you sure?
> 
> HID_QUIRK_ALWAYS_POLL = 0x400
> would stop suspending the device.

Actually, it forces the kernel to poll the device's IN endpoints even 
when no program is holding the device file open (see where 
usbhid_start() calls hid_start_in() if the ALWAYS_POLL quirk is set).  
This is exactly what the speaker seems to need.

As a side effect, it prevents the device from being suspended.  But that 
doesn't seem to be the important thing here.

Alan Stern

> HID_QUIRK_NO_IGNORE = 0x40000000
> would stop ignoring a device that is in the ignore list already.
