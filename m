Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795516788;
	b=Dx82du9ZbaZzDaQP8JJfkm+CJxe8iBcCRCc6XySyuNk6AfqvfJkBC8na0yCjrp3FKQCj
	 kafPJkOJXENxQZ9zQhc6LAzQIUNIPt3kGfZIhrfYO8f+6FuASE/0eDS9LaA40T4kGbUbM
	 sQk2n/Jcq4ZTt85xQSo5p9mt77tPo4diNcR3GzPTLCtubxvFqxX7Zc2fyuAFhxY2so9v8
	 YkiA2tjjKwI5IZ9R1OJYbvlVCxH0kpjDBaQPWY4CSMEZqx/gGBLyBluQQ7tVpcRXnRusZ
	 3wyAdwB6xoF7Z3wZh9pYpu33G7Da1YeQBz6vMo18TT3gSSNfFbTR1hBrItjDEdRGyAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795516788;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=i67A04/jloiIm4Idm3ymNHqESyF+RQsVbnS4UKmnxA8=;
	b=XBW7dLcSaAUE1oE+r/pmPtzM8xpL81vSj+d9U1n2IupHpO3g8oMR+SqmLU2fPHFwyQ4d
	 PC2ymfzuoQFK5BbEVESn9AWt2p0MVAHu1PYEzXPyj0I7St48S8vpvqfVxghi7JDLI503h
	 r0PNpAgzljH9f2VfK+xxWKFtvYL9RTgdQzwd2i1Qbr9QKjDLyms/wPHumVO3Sa4K5xKpf
	 5aLDaTeJccyOZE0UVX32cokpiegWVv9IyIjpZXO+Gfu38fzcC+JZHuHsM1J3hL8p43thG
	 m/HGgQaNTJK0wl3OMFCfr6Pq4ZB0kGzVzyl0PfdFhi6BP5AD1R5S9cUYPO/3nKMaVew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=KjiX7YWe;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D25606A32D
	for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 10:39:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28D25606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=KjiX7YWe
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb61185057so28148675e9.1
        for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 02:39:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795516786; x=1796121586; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i67A04/jloiIm4Idm3ymNHqESyF+RQsVbnS4UKmnxA8=;
        b=KjiX7YWeSkA9Dw0WA5xjWaOqnyEHCedD00sUzMhE3sKEAvQ2TPIHmIyS+enWPn9hqU
         UHnNtz+vsI9HdnLLJLRNEHpW3n0qDPjDGGb+MMmUEkY4+DtknEToZAEEAwd6ErlDRM4U
         sl6ks9V8P+KgBQBXge6XtIwqjU1IX32GeqDZpfsQ5053CJLA98ICyRMFUcjrF7GwSx6y
         mLBhDMnek6X1+TiwUBOkVQB80sS1Z2oue9zDTiR4H+wlMmpVb+6EJ+EZoBBfGsOtxa1G
         85CHt1w3B0RFKCYDolOV20zywTKINPHyMkeAAvRZwyufXjasNY7vVq1oJTMaEgpAJPJ9
         588Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795516786; x=1796121586;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i67A04/jloiIm4Idm3ymNHqESyF+RQsVbnS4UKmnxA8=;
        b=km/Zu2h4H+y5HM6yZLgytiF0w/6inC04LDTG9hSMcnEt7A3us3VZ/U29bVyN92RoYs
         hygA7E/xjBitgYZIl9irvkJ+L0He6UO4h4vLSmszvIqGIRM0UHyGZiytv5P8dt+yDFLk
         dB6h005vMXT+QdYAJBz/Zl7l8jS0Lnd+d5pLr2fz4UN6Xp99p4YyQHQfOSKfsDpSXlgj
         HQcZLC+DZmVK8kKQ6wsGUS+gtNHPdNvKz9I0MXjcU5goNHKyxEs6C4Jw+iQMvI/C3wu4
         SISA/9oYe07JRohCpu/nLfkE9zN+e/kizo192+7JzJ/jA8+sIs+eVfK6jnAMLfYBYu2e
         6pag==
X-Forwarded-Encrypted: i=1; AL+hErEsAUwauwTIABNTrGgQmUsINrKnJqkFP8G796iw5g5fBJ408ZtrLXKWc38El374yZTqMmsFB7wcTVYTLA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/U0bnPFaGvw4Qb/GcFRhlzPZgOEWXmfclzdNXI2L/A18n5N6+N
	zxvr2KTweWUcP4nfTz/JklTT+uweAbOwGEpoyuXXCBuHkwAp3Xa7wxJiFYbg66ctPwk=
X-Gm-Gg: AZFdTZd7pLL2My/6kUSqAJ+z44l37OLcB+a1bgxTX4bjWnkXAbnHKOplMK/rG7WYq+W
	/MVePQgdhGSR5eFKcOAysnylIKVsn/4fpwuvTgmsd3xQXzO4CnldKl5qecjJIG62WJ8wmhV3rZo
	05NC0SRyMSHtusbEeak0JUpV6TuX0MhdHaG31/4suCfMJeQJxjNxb05EqMnuZgCpQO6nMfiwISM
	JBttLuDWcsX6cSioSy92l8PkBNNV2mF5qhF+vpq6h8DAqIC1NBDGT5EVEMjeQEFhJxK7dDqcCJg
	K3lh+keK93OdkTeryw7Clnn/rEGnuTuCnOseS5Td6/YCyA8IL4CK+b6rHxXpTUlpprMHNT21QP6
	45kri5WOrqvgmka3dDcQrXlkcl8UPXaiC8TDOWBpwHXbyQiDeprHfao6ZBL6NW3/YOlzPSKEjl7
	y4g8K8ww85gicnS+0Bm/r6CJEKWykjcbiKENZud7KDDLQivtgISrPcQxnULx1BW0usbT5QlkA6+
	Ia/xMYhAZ1DLxPytl9imihQTVUZcV+hRHMdKAgaDo7CtFwwNxM1YutlwCF3uFM/ZnE+AJS9SLEK
	yZPaX46rASdgSLTvcIYZiwrss5klbHf2hguRYqdXLiOoxXAafX0ZoytiBZckbehsjYFf
X-Received: by 2002:a05:600c:64c8:b0:4bb:6848:d433 with SMTP id 5b1f17b1804b1-4bb8881d141mr281064655e9.26.1795516786433;
        Tue, 24 Nov 2026 02:39:46 -0800 (PST)
Received: from ?IPV6:2001:a61:132b:a401:6cb8:7c28:11e1:499? ([2001:a61:132b:a401:6cb8:7c28:11e1:499])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b2c5sm425218335e9.5.2026.11.24.02.39.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 02:39:46 -0800 (PST)
Message-ID: <65749362-927a-492d-8bff-573c277fe456@suse.com>
Date: Tue, 24 Nov 2026 11:39:40 +0100
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/33] Bluetooth: btusb: Fix MediaTek ISO claim locking
To: Leon Romanovsky <leon@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Johannes Berg <johannes@sipsolutions.net>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, Bjorn Helgaas <bhelgaas@google.com>,
 "Joerg Roedel (AMD)" <joro@8bytes.org>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Vasant Hegde <vasant.hegde@amd.com>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, David Woodhouse <dwmw2@infradead.org>,
 Lu Baolu <baolu.lu@linux.intel.com>, Johan Hovold <johan@kernel.org>,
 Eric Dumazet <edumazet@kernel.org>, Marcel Holtmann <marcel@holtmann.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Nipun Gupta <nipun.gupta@amd.com>, Nikhil Agarwal <nikhil.agarwal@amd.com>,
 Pieter Jansen van Vuuren <pieter.jansen-van-vuuren@amd.com>,
 Chris Lu <chris.lu@mediatek.com>, Mans Rullgard <mans@mansr.com>,
 Alan Stern <stern@rowland.harvard.edu>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Andrew Morton <akpm@linux-foundation.org>,
 Cornelia Huck <cornelia.huck@de.ibm.com>, Andrew Morton <akpm@osdl.org>,
 Jeff Garzik <jeff@garzik.org>, "Rafael J. Wysocki"
 <rafael.j.wysocki@intel.com>, Bart Van Assche <bvanassche@acm.org>,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 Dan Williams <djbw@kernel.org>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
 linux-input@vger.kernel.org, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-pci@vger.kernel.org, iommu@lists.linux.dev,
 linux-coco@lists.linux.dev, Alexey Kardashevskiy <aik@amd.com>,
 Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
 Greg Kroah-Hartman <gregkh@suse.de>, linux-sound@vger.kernel.org,
 Jason Gunthorpe <jgg@ziepe.ca>
References: <20261124-device-trust-core-v4-0-037eb0d17b1f@nvidia.com>
 <20261124-device-trust-core-v4-2-037eb0d17b1f@nvidia.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20261124-device-trust-core-v4-2-037eb0d17b1f@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 24.11.26 10:43, Leon Romanovsky wrote:
> From: Leon Romanovsky <leonro@nvidia.com>
> 
> MediaTek ISO claims are performed from HCI setup work outside USB probe.
> Locking only the interface does not protect the claim against teardown
> of the parent device. Unconditionally waiting for the parent lock can
> deadlock with disconnect while it drains the setup work.
Hi,

your patch raises a question. Can usb_claim_interface() ever be
used safely outside probe() without this kind of locking?
If the answer to that is negative, should the locking be integrated into
usbcore?

	Regards
		Oliver
