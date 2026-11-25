Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795617774;
	b=mzyvQYvXm+XLcpZrAAVanbZKY/S0XoezTuKboEWSziqFkF6ob5uz2wl4aQRYD3QoZDl+
	 uo2AlKrnE2QLqYVbfzTVTT2ryABixEhZVEpjlZeGeV12xap6vurzRK6y0hH2TOmO6xtBV
	 5iECKPyePHt19GiJ8z/VsSLOLuvqn4m6P+LEWjJek9DBaqRY0m+QqplGlFH21qfQomHWr
	 sJVZ+2f4f1xca/iPNpvUmop1tx3kxDSG/Ib+UCEq4xuvOctcQ7Jm/JRYStgY3ZFkYJVKo
	 qHPY8qRA3Ucgafp6Ks8AYMdvP6ca3Sojf6kPz6pWIp1H5fMg+1qcR3p2sTq0ovs/WBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795617774;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=pe1ZMe82aYurb6rarn1VrDghVHB1DbUnPtYdYIQXQBY=;
	b=xZ83OJkqDjbv9Y4CtdcZhZVNajKeqD8oSy/vXhPVD5NgaAe3aiW4DgdNhdakWITwmfyu
	 tslxeci4m3MsipkwTZxgw1OLjElw9tFPEgbZ/qaJI55sAP47zjkg8rO/w6haXlCBBPUaD
	 aIEh8RNQvVVvl/FOBAKIuigwFbjsi5dSb3ACHyIsM+JibJ2oQc6rgPvyOfwn3WuhHMS6D
	 yt2/H/XO5FSnF+T7icnBqpv+z0ECkTxNfO679cIoyXGq3SHqwvM08RGFUmlhjqIy9FQ4J
	 QHYJtQquYYOIMiZuqlaK8Qm9U0FpOnqQp1gAVinxTuUhdyIVO/kue+SM7iSti2y36IQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b="EZW3/ZuY";
	arc=none smtp.remote-ip=209.85.160.178
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95115606A31E
	for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 14:42:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95115606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=EZW3/ZuY
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-55c38cdd5b7so43281491cf.2
        for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 06:42:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1795617772; x=1796222572; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pe1ZMe82aYurb6rarn1VrDghVHB1DbUnPtYdYIQXQBY=;
        b=EZW3/ZuY9WExbtSmj8DEkIib33heZdtGlhNDFx+tWdjASShaGJG9l1m82Kj/MaL+Fp
         dpSIbAnEHbFlVz+hIeuZe2jUZo7AJHmM9qcPUK5q4JUVqrygllkLlH5tKigPAwlBeJEB
         9LB10PLPNriJ9LdP2TBPATITfz7dOocLcdPXlVrWDP+RhnNxnuqb2E0hJfrMM+wCq9Jj
         0kjnypjQJIIlk11Kkm8Toq0P5eSeNb2pMa1k0pZ3FpVxzPKKXpMeyZeumx/o0vJkVbcZ
         vPXRC8FrppaPLwV8HvL9WH84Z2AFAp0gZ44kP+l6CyLkE5MwSC6VlDY2fKA7gEMmX/Xv
         DhcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795617772; x=1796222572;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pe1ZMe82aYurb6rarn1VrDghVHB1DbUnPtYdYIQXQBY=;
        b=ZfnIhO4CC0NRuHMZbe8kYL7fgj/duEEzNI2Cw9+YefHRfMNlVNmmgJLOfIxCc75+je
         fr/WDv3CXAAm4zRbcXkV+6BigEj6tMqY0EIMK3n9Xp1yzDk/v636aKwbiMA9zB2AnBxV
         kUrRsQCVBjhq1gEaQEg/LQCYiWgD3ywfbhgvSLqRlAEzTrYJ0oJzf74UemIMJIyt9onP
         5/jq0UHf53zH5UMIACigD1IrRBeXwa08M1g016mhobNemqeAuyiBgKVDS/e9OYXPm1UQ
         J/2Z7CexDY15Y1iyYYAcF3atmuJWe/a2H9GU4MPMTVjVa3HiPd++mc8glGTcaBkTP0TR
         9bXg==
X-Forwarded-Encrypted: i=1; AL+hErF2kqxQUDxP8tA44LcSRTKqXcwVi57blrnYICXNkTpVjPuOv6JUHsZeSLQEsXopfjfpYNOXba+RGxnfWQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8tAOnW2l+JspAMFBZJtrSsNWcgPior8Nn4fRNJE+j5m5uyN560
	TWbIhTl3b0dl7dbO8zO35JKeAHSUgNiSUUjcVvc3NdDVkgUsGEsKHiAsqcnezCJ2kccThFLHaHd
	xbgn87Q==
X-Gm-Gg: AZFdTZf1M2yXnAp0kltZXzvDKi7sMUFv7foAaTi7eISfB+IMCac4z5lwKTdc7Eke8O7
	7jI85z128cfQyfoKGi4zI6VfA4y8nrAnp0eL+bpaS89GXftsYeaHD7Ij3zDGS96pelW1Vfq8gfi
	33S1G1Vn9yjORMvG6ukCfebSICDlsyn8x2AJXRrTxAjWslnGzdmLo11e4TJ3K9NIF2R3MtASF2q
	bw4h2ItYciyCtVnkIIQXI7uTJxCZQyHAUFqHiMqWdM6DxAdrxa9CIYp9ZNQBRTSutOaaCZZf8mh
	mlhoptvxb1YMTGHuUPZVl562OwZzJgpdkLH79RI/+MK1oO2BxucMhgjyRjwerpAuOJdh8vzxVI4
	2WlX+OMhwnk9j4iQlg6qaVGxsevzi3NnBXI6NLTTe2I0o2ZAlrRNvUmJz6i0P08J8wVxVxZc+xI
	/MVL+S6de1YPbt1NC9pny+ZD0RSa9BFqBsiTVnXxT0QNc5MfJeOXJcekk0zAUaSE3pqqbOGFYD4
	v7U7ZosxukvM+IYFiaH+FBXd/F0UU/eRLlI6WoxSV4Klb+axC7nQCixxMnlvdWju3uxUQ36M6OJ
	KfmfmfhJngCIpTiqXzhiDILeYEZeDg==
X-Received: by 2002:a05:622a:a19:b0:55d:33e0:abff with SMTP id d75a77b69052e-55d76933293mr358229581cf.6.1795617772385;
        Wed, 25 Nov 2026 06:42:52 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d00:161a::9a34])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d78e4fc12sm154986831cf.0.2026.11.25.06.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 06:42:51 -0800 (PST)
Date: Wed, 25 Nov 2026 09:42:49 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Kettler Christian <christian.kettler@stiftung-kifa.ch>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Subject: Re: Logitech BRIO (046d:085e) stops answering control requests when
 hot-plugged together with a USB-C hub; usbhid probe blocks hub_wq for 60 s
Message-ID: <6118ad01-65a0-4357-8118-3122479b554d@rowland.harvard.edu>
References: <3cd5f994a6260960cf7751d6383f2b9afc1baeb5.camel@stiftung-kifa.ch>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3cd5f994a6260960cf7751d6383f2b9afc1baeb5.camel@stiftung-kifa.ch>

On Tue, Nov 24, 2026 at 07:56:35PM +0000, Kettler Christian wrote:
> Subject: Logitech BRIO (046d:085e) stops answering control requests
> when hot-plugged together with a USB-C hub; usbhid probe blocks hub_wq
> for 60 s

> 1. Is there a known issue with the BRIO stopping to answer control
>    transfers shortly after enumeration (with the usbhid probe being
> only
>    the first request that waits)? Would a quirk (e.g.
>    USB_QUIRK_DELAY_CTRL_MSG for 046d:085e, or an snd-usb-audio
>    control-message delay) be worth testing? Ignoring the HID interface
>    alone does not help.

No similar issues are known to me.

Go ahead and test any quirks you think might be relevant.  As for 
whether that will be worthwhile -- who knows?

> 2. Can the kernel recover from a device that stops answering control
>    requests during probe without blocking hub_wq for every interface in
>    turn?

No.  The reason is because the device might stop answering requests on 
one interface only, but go on answering them on other interfaces.  One 
non-working interface shouldn't prevent other interfaces from being 
probed, if they might be working.

Alan Stern
