Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE1E242D6A
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 09:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762852575; cv=none; b=ZHNFmAhbmOfToRpnhXhHRq9MTSoQzbRmeMAvDxOA8NlqEpagsajVRamDZBY7+5+8SxNF64jmb4WNLqdHvXyVIR3+DropzfU44pyKiIKUeMBnLZereNNBvCAF5T1QkLTgdjSMiQxjEfgP40IhlOaOg0zefcrg69hMODarNbpUoP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762852575; c=relaxed/simple;
	bh=hnP6MvOjehHku2Mba8SR807PCuY5/tHtJ5RDALFOZKo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=froI1KZCQ/AFOLa8pnr+kDbXikO7RaIV3ruImER4C4n5f2CiI6y48qZ/OZ0gvVHwzDBO7BwLh5AdoqGX/UOvAog8MU4LVrB6z2+5NRbZzMD2C+2jYDlTk0ySj9hNXqp5abTodR1St3RYnNp9MCx4FDvIiqaAGAiE+ta+n4OMeis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=DBvI1/9C; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="DBvI1/9C"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b72b495aa81so466640866b.2
        for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 01:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762852572; x=1763457372; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QWPP6QWzDSQG2koCI4Uqgz32StVhYVJIJ4zaGLtn5t8=;
        b=DBvI1/9Cy/Xuo1tGlbGlyjwRNz4devwwNzyXWJciRnnEbqbrLe5vcTd21Xy1XdI8Bu
         RHDcT7W01ks4xNszoI0cv70IqdezTFruyOxzgoEIZyFF9GarzzSjoS6K9DUOYwwkfIbp
         6k3ycOs+p2NH80Irorxuvk7WIGgz8TU+H/tL4ZKfG52GgEMb7aOQ/CKVT1bFPkxAmump
         RPv1zqxxCBefUdx27KqeN7qCv8v23oncF6jqlJvb6fhRMdE0MqgCGDWL06RFn8+mRG3U
         EkOIEAb8eE0SDX0B0SD4BzPZHFivRjaEjo84o3LZn1kXQFavcFwHpBOxFSbnWjRcasaE
         nbgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762852572; x=1763457372;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QWPP6QWzDSQG2koCI4Uqgz32StVhYVJIJ4zaGLtn5t8=;
        b=YucZH4a+x/WjD8yI4ivuApkYitvQMy4qsrZYZRUkFnqnjtjbyyhXfbcbRWHADAY/Xz
         +9aqQGK3JGSTSmj1LNe3AAeXmm4OEw3Z6kE8EsAdguwCWprY8Zd+sXjVg/ZZYOk22HuX
         wIm5eSRJbkcOACF+27HpfSKTa1gy+WKkzUdvaYkH856IrhE8xWS19Oq0QIsdK7dalgEz
         NZDWEdAzh7pzZ3xEN68Pck+dOAHNLvwFHlASOWIDu8eTVF+XCpRX4ZRDTKwJyEjDDRg0
         A7prKoSOIk6b5OIseN/acz7bwi9O//ZqcpaF9R61PoFw0xVa8dsmKvAf/CK9VfUviE05
         lzGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRmY2Ampgoq7hT+QyU2MO+/pOmXt/ye7ZXr41OFTM4TAGl1hKFZB6ezv4PwKKotLe6QlX674il1T4WyA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyt7DaG5qowWh3XaDI6fniZqu9SxLAq55Hwe/PFb/grgcH1T8Pf
	DHF//P+X55QdekivTNtiiIMoeMVzJOTeZLmvSTCI7h5jcZhgIoD/Mo/Pde+apRCU2ec=
X-Gm-Gg: ASbGncupJ6BW5vzC8HAD8/uDC+lEpqMpP/IB1Q2YRvjkkKgH8ZzRTD6ul+92UUvhFBq
	qKLV4uou9xPQNx1YKyrVAXR6XmEJG7aEniXQqXcAasKmEnDwbWPfDTrzjmb5THNOFUg3lb1LVrL
	fduu9m7JNJn8agCeYQgIqabjzZKblnEvW8L3EK7b385vp8/PzgEIbad7bjNAdHopYcUpwsu+2kA
	T27thyBpJPhT3ew+RT69NQ0mHNwY02fZbuuJWBxmcS2kFz6KJLkjQCu3xlKoZEaeVDt0ed4DFMH
	X0QhXlGTX7H2Q0aZjXVhOLy6o3m2LcvKJYsumalCrOZk52FmtLzN2lPlnCFlWQLUt8XJ3wz6VH2
	qxpZly2N3xflUA258aAyeMpT44mxaGhgiunK5oIRDVJ7juaLS6sAHmDwIvMag0QSpXd05J7WCwg
	cxz4YzjPIH99VqpJrGRDRJ/nEOLhwXormWkYFWgg==
X-Google-Smtp-Source: AGHT+IH930mFApbAim+hsItNZIanFSAxgWzf+l4tHBB1/03gGvYojtijguoMFNaE7u/zdx8GkYVgoQ==
X-Received: by 2002:a17:907:7ea4:b0:b6d:7859:61eb with SMTP id a640c23a62f3a-b72e0328ebemr1045116366b.29.1762852571028;
        Tue, 11 Nov 2025 01:16:11 -0800 (PST)
Received: from ?IPV6:2001:a61:1328:3001:f150:c1:f1a3:b448? ([2001:a61:1328:3001:f150:c1:f1a3:b448])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bf31286esm1299966766b.21.2025.11.11.01.16.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Nov 2025 01:16:10 -0800 (PST)
Message-ID: <2a6b4d25-e963-4019-857e-28eaba53a69a@suse.com>
Date: Tue, 11 Nov 2025 10:16:09 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] Edifier QR30 (2d99:a101, Jieli Technology) reboots itself
 when RGB brightness button is used under Linux
To: Terry Junge <linuxhid@cosmicgizmosystems.com>,
 The-Luga <lugathe2@gmail.com>, Alan Stern <stern@rowland.harvard.edu>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Michal Pecio <michal.pecio@gmail.com>,
 Terry Junge <linuxsound@cosmicgizmosystems.com>,
 linux-sound@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-input@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>
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
 <1ac9d1dd-822a-487a-bd42-45c163dfbfe7@rowland.harvard.edu>
 <CALvgqED5NCNjrtv_YSfg9rzerK-xWAE5TaJjZtMBMcY=8MSk3g@mail.gmail.com>
 <c6d506f7-f13b-4d57-a522-a2ccd09e7a1f@cosmicgizmosystems.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <c6d506f7-f13b-4d57-a522-a2ccd09e7a1f@cosmicgizmosystems.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11.11.25 06:11, Terry Junge wrote:

> Polling for input reports is handled by the hardware at the interval
> requested by the device during enumeration. There is no intervention by
> the kernel to poll for an input report. The only way the kernel can stop
> polling a device for input reports is to suspend it.
> 
> So ALWAYS_POLL means never suspend.

Hi,

that is not exactly correct. ALWAYS_POLL, means that

a) the device is always polled _while_ it is active
b) if the device is suspended remote wakeup is always requested

	Regards
		Oliver

