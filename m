Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793473826;
	b=BlCm0FAS08JwJDM+NvuXyJ/otXsg46MsmuplJHTMC5i+m0RUMhzD5Nwe2fmtbREHlqiS
	 4BdFYOOEC8MzsBTPOxi2Q0o8Cpd2jaBqW9dVdEm8SnqvpbBVifhqEyCiufGdwQZhxzUX4
	 Cy8K00WqEcN+Uym1VbnF6ciBfTXE+q9lvKQoAFY9ZAjDSf+l6PI0Am0LFdvh1swK0oWjk
	 Xc9T1pQjHAufWmufKmIX4FyT0Y97biGx6f+qZnbgS/6kIYQ3kzuiXef8Jw4gNDNFWERvD
	 buChRPc/Hij6+/kg/NfEbYusoK3AizGw6DoKugOBvSqm0AWku7mk1WqYYlOFh9AHdlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793473826;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=P15p9Hb5w1tBvsdlJFg638wJNRLHIyW6DyqlyUCSHFc=;
	b=YdqjQgHetGVtz2DzAreZ85h6KOGXJnpTg9UIsLty25wquEOFyynToOpSO5NwYrzawv4i
	 uXtlnpKLzZeFYb+rk5Wv/xkKnPl4Kso7EPMie8z7+vVEJqrmlDY4c95ATKTFbSkW8kzFk
	 u2qObAl94ZEgO9PMrbQzIvv3X6q6f1JzxT5l8T0tQMRA9DAWfwuBwa9GWdWmAseIzXnnZ
	 GeNFEPolwQd96Rp0YNbMpJe9cAjoEdB7Z1epE3A7k+mev6tRJObDXVXPFAyg5ayx0CNhM
	 jUYJRzwQRlKjDxu29zB6hbs5tMTHh8bdw0/nIfTX4rwKyAtfG0ufMmY7zOGbT/FOiFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nexthop.ai;
	spf=pass smtp.mailfrom=nexthop.ai;
	dkim=pass header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=M0iRGKX4;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC521606A321
	for <linux-sound@vger.kernel.org>; Sat, 31 Oct 2026 19:10:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC521606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=M0iRGKX4
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-36a0f27c9f4so3123686eec.1
        for <linux-sound@vger.kernel.org>; Sat, 31 Oct 2026 12:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1793473825; x=1794078625; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=P15p9Hb5w1tBvsdlJFg638wJNRLHIyW6DyqlyUCSHFc=;
        b=M0iRGKX4ZakyHPXgwlWKQuWrbvUmrEt1k4+8j+Da6Dso/Dh7GSCRhGjVKtDYwfzJrj
         2HEAllh00C24MUCD82TGUaZz4bWnjiMTRhAzuWXvWqNUwh9NIMyFAIxSoJmQ4tgmhnAF
         F245HULIR/4UBpfnm4XNgJVWo0HiMpt1bXAuHbkJDG9vLis8pelTxr1WpUiwasUmrW+0
         9tOkzQntOI0UA8bT96YYn1nh7WxQBJCWb1rCljfbu4Ofk4oPQ7yUkax5ncCroyqti4PR
         O+aX72UPS59IWB8w+y+J4RXBJLyCiSRq72tVighCAw7INgBmnyi41FWHKGgDOpB397rH
         f/EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793473825; x=1794078625;
        h=content-transfer-encoding:mime-version:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P15p9Hb5w1tBvsdlJFg638wJNRLHIyW6DyqlyUCSHFc=;
        b=M6uLjxxtlOftYjEqUq07KLtKi6/0iaj0yUHOtBRD0RUrK8eLSQcntCSWWW1Pq0/VWy
         kbeTjSgaTkwNNJHRX6U4p7zPL69XHtqYw/v9LTIhmJE00xqH5tMM5ARLkgQLQejhxBrG
         ys5eeORhnjE4LnxqrrOqQVHkNUjS14qd5COIPl+zBnBRB0NaqyI4/EzOghzEkrcz5d35
         GS8bwd533w/Pb6nDQRX0WWYmM/Yw1+kYg2VmWwplDUCKkL4AWn93DkmrxgCKHYiBQMWK
         rQ7SzYrXQlIu+gYVQwtZQAsd1EshLp5y5j7j1so4UT5up6k6XhXLrJmeusftYycrIby8
         tBvw==
X-Forwarded-Encrypted: i=1; AKwUvBwctd+2qGRVUdDigTpWnxMTZAxplILj7G1BY8PrwmK+FHbeNaqWqg5Q8rKxcbRKDSVwky8J9LV4J48Akw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJMzDZKlP6OyInUp97mU8uFvUiMiAQf0xwbD0cnnyEMGFBGEMyU
	+kY6faf12QFFgF2qAimeo1mJeOb6E01r93V9cCHruYHF2RDDx3t7NJm4/9vuQzjjrfc=
X-Gm-Gg: AYBFou1BR0apzPwCopimSG9JBSkFVLp6nY299YouqoTubyIG7mqUrUp62JjBKPQon9M
	QsX9Z5huoffb6lOMA6bjikKsAPeCimyfTovap3NZshqQQ/R5qJtIVygaxUJ+G8Rymlva4jMjS1J
	3Z9whX1fuE5nQuUxMDEXTHwN99HIcS91OBJ+6DPU4ov6YK6NQWyKZR5h4HqTKDL5RxOLFftQ8/k
	rSmHi+YCPWfTbAO2rjMnOqETE+Zj4EEM2eef1/h1XGDM0cY8eJ8tTW0CY2vJ2SywoCmM5Q3jL5u
	NZ349nW5cW0iTMM5sDD6NMgVkZG/OlyyUCc1/U4PPbkqiwIo8Ca7iVR3R3F9ISwLrJsSP0V4WxG
	cGDUiWPRO7E6G+vJUSA3Vwxwmy8QveJzt+5WxTcsndbULEXZmVN3VgX41Tu5oEWjlnBBLdfYfz8
	j4+bDYHuNmOonKGNdVXmooW+TWwMw+5dNBo54ugLDocmbbPKygR5NEYT+HQIlneFJ+BHN4BNpzT
	rSkyRCwKLs5R1C+yDdYKMTqsZKdmFi7LLzmWgqXFb118hjcnY32CZhL5SeVjp81eKCt+ZzuUqYu
	PHIV5utXK6CPKtPSpwdn5/XOlHDPcM1+bYRGHhY5i3dycZBq4nY=
X-Received: by 2002:a05:701b:4515:20b0:166:5552:780a with SMTP id a92af1059eb24-1ac5b028b11mr7948547c88.8.1793473824427;
        Sat, 31 Oct 2026 12:10:24 -0700 (PDT)
Received: from localhost ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1b38ac58sm17384804c88.23.2026.10.31.12.10.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Oct 2026 12:10:23 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Sat, 31 Oct 2026 12:10:22 -0700
Message-Id: <DMJ9ERWOMF5G.3KVDIP2QE3A7J@nexthop.ai>
Cc: "Richard Cheng" <icheng@nvidia.com>, "Andrew Lunn" <andrew@lunn.ch>,
 "Rob Herring" <robh@kernel.org>, "Saravana Kannan" <saravanak@kernel.org>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Danilo Krummrich" <dakr@kernel.org>, "Bjorn Helgaas"
 <bhelgaas@google.com>, "Charles Keepax" <ckeepax@opensource.cirrus.com>,
 "Richard Fitzgerald" <rf@opensource.cirrus.com>, "David Rhodes"
 <david.rhodes@cirrus.com>, "Linus Walleij" <linusw@kernel.org>, "Andy
 Shevchenko" <andriy.shevchenko@linux.intel.com>, "Daniel Scally"
 <djrscally@gmail.com>, "Heikki Krogerus" <heikki.krogerus@linux.intel.com>,
 "Sakari Ailus" <sakari.ailus@linux.intel.com>, "Bartosz Golaszewski"
 <brgl@kernel.org>, "Len Brown" <lenb@kernel.org>, "Davidlohr Bueso"
 <dave@stgolabs.net>, "Jonathan Cameron" <jic23@kernel.org>, "Dave Jiang"
 <dave.jiang@intel.com>, "Alison Schofield" <alison.schofield@intel.com>,
 "Vishal Verma" <vishal.l.verma@intel.com>, "Dan Williams"
 <djbw@kernel.org>, "Ira Weiny" <iweiny@kernel.org>, "Li Ming"
 <ming.li@zohomail.com>, "Lizhi Hou" <lizhi.hou@amd.com>,
 <driver-core@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <linux-pci@vger.kernel.org>, <linux-sound@vger.kernel.org>,
 <patches@opensource.cirrus.com>, <linux-gpio@vger.kernel.org>,
 <linux-acpi@vger.kernel.org>, <linux-cxl@vger.kernel.org>, "Allan Nielsen"
 <allan.nielsen@microchip.com>, "Horatiu Vultur"
 <horatiu.vultur@microchip.com>, "Daniel Machon"
 <daniel.machon@microchip.com>, "Steen Hegelund"
 <steen.hegelund@microchip.com>, "Luca Ceresoli"
 <luca.ceresoli@bootlin.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v13 00/10] lan966x pci device: Add support for SFPs, PCI
 part
From: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
To: "Herve Codina" <herve.codina@bootlin.com>
In-Reply-To: <20261012142826.159178-1-herve.codina@bootlin.com>
References: <20261012142826.159178-1-herve.codina@bootlin.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Herve,

On Mon, Oct 12, 2026 at 04:28:14PM +0200, Herve Codina wrote:
> Patches 8 and 9 fix fw_devlink issues specific to PCI and the
> device-tree nodes created during enumeration.

We hit exactly this on x86 switch platforms with
CONFIG_PCI_DYNAMIC_OF_NODES. A driver applies a device-tree overlay
onto each Xilinx FPGA PCI endpoint and populates I2C controllers
(xiic), watchdogs and GPIO blocks. Their interrupts go through small
chained irqchips that are themselves fed by the FPGA's MSI vectors.

Without this series, fw_devlink drops every supplier link under the
synthesized PCI root bridge node ("Not linking ... might never become
dev"), so the irqchips end up with no consumers. Unbinding one of them
frees IRQ descriptors that the I2C controllers and the watchdog still
hold. We get a remove_proc_entry "removing non-empty directory 'irq/N'"
WARNING per IRQ, and the I2C controllers are dead until reboot.

With the series applied on v7.3, the device links are created (up to
32 consumers per irqchip), and unbinding an irqchip now unbinds its
consumers first. I tested on two platforms, with 2 and 3 FPGAs (4 and
7 irqchips). Repeated unload/reload of the irqchip driver was clean
every time, and everything probed again afterwards.

Tested-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>

Thanks,
Abdurrahman
