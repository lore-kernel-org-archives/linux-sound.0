Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F49A80C
	for <linux-sound@vger.kernel.org>; Thu, 21 Dec 2023 14:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k8/PFBQP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84BA1C433C7;
	Thu, 21 Dec 2023 14:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703169729;
	bh=1rUHiSbBzjZVq93Y196VyIHTz/47RV9BbEGJsxBHTvo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k8/PFBQPxgb8+8FO147mx3fDfrJK0dIOwopwg0IfJtTJaIEL/ipCAvacL8FX2u59O
	 RB0TuxRKwJVqV8PLujLJ3SdiSvNs3tj15Yl0IDYqeuioyp9G48ZVJVLbkAwH6Gj2/h
	 QsKslRgtF3NPheJNkvHutSZYx+hcYkpM4UW4tgq3LQVu52kFWsiYodwQ7olrsGIove
	 qqEvDbVHjPaudwZAHZmKfLuceNkWMui4zgtOWveBBysvijkbdZ8Hr+8kvE2WEiO9gf
	 IW2xeDs9FpcJYdMw6T+TZU76W7dlpqccXW7uo1vD/nelr+OiUmZ5T3ItFXb31+ikCT
	 yj9MrMtqv+7Tg==
Date: Thu, 21 Dec 2023 20:12:05 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.de,
	broonie@kernel.org, vinod.koul@intel.com,
	Bard liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	srinivas.kandagatla@linaro.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	vijendar.mukunda@amd.com,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Shuming Fan <shumingf@realtek.com>, Jack Yu <jack.yu@realtek.com>,
	Oder Chiou <oder_chiou@realtek.com>
Subject: Re: [RFC PATCH 09/16] soundwire: crc8: add constant table
Message-ID: <ZYROvUA7RrqQknlM@matsya>
References: <20231207222944.663893-1-pierre-louis.bossart@linux.intel.com>
 <20231207222944.663893-10-pierre-louis.bossart@linux.intel.com>
 <ZYA0gKf3bZgY4X_s@matsya>
 <121b44fb-9d2f-4e1f-beca-a54b16d7e13c@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <121b44fb-9d2f-4e1f-beca-a54b16d7e13c@linux.intel.com>

On 18-12-23, 14:26, Pierre-Louis Bossart wrote:
> 
> 
> On 12/18/23 06:01, Vinod Koul wrote:
> > On 07-12-23, 16:29, Pierre-Louis Bossart wrote:
> >> Add the lookup table required by crc8(). All configuration values were
> >> directly table from the MIPI SoundWire 1.x specification.
> >>
> >> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> >> ---
> >>  drivers/soundwire/Makefile |   4 +-
> >>  drivers/soundwire/crc8.c   | 277 +++++++++++++++++++++++++++++++++++++
> >>  drivers/soundwire/crc8.h   |  11 ++
> >>  3 files changed, 291 insertions(+), 1 deletion(-)
> >>  create mode 100644 drivers/soundwire/crc8.c
> >>  create mode 100644 drivers/soundwire/crc8.h
> >>
> >> diff --git a/drivers/soundwire/Makefile b/drivers/soundwire/Makefile
> >> index 657f5888a77b..170128dd9318 100644
> >> --- a/drivers/soundwire/Makefile
> >> +++ b/drivers/soundwire/Makefile
> >> @@ -5,7 +5,9 @@
> >>  
> >>  #Bus Objs
> >>  soundwire-bus-y := bus_type.o bus.o master.o slave.o mipi_disco.o stream.o  \
> >> -			sysfs_slave.o sysfs_slave_dpn.o
> >> +			sysfs_slave.o sysfs_slave_dpn.o \
> >> +			crc8.o
> >> +
> >>  obj-$(CONFIG_SOUNDWIRE) += soundwire-bus.o
> >>  
> >>  soundwire-generic-allocation-objs := generic_bandwidth_allocation.o
> >> diff --git a/drivers/soundwire/crc8.c b/drivers/soundwire/crc8.c
> >> new file mode 100644
> >> index 000000000000..b6b984d7f39a
> >> --- /dev/null
> >> +++ b/drivers/soundwire/crc8.c
> >> @@ -0,0 +1,277 @@
> >> +// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
> >> +// Copyright(c) 2024 Intel Corporation.
> >> +
> >> +#include <linux/crc8.h>
> >> +#include <linux/module.h>
> >> +#include "crc8.h"
> >> +
> >> +/*
> >> + * the MIPI SoundWire CRC8 polynomial is X^8 + X^6 + X^3 + X^2 + 1, MSB first
> >> + * The value is (1)01001101 = 0x4D
> >> + *
> >> + * the table below was generated with
> >> + *
> >> + *	u8 crc8_lookup_table[CRC8_TABLE_SIZE];
> >> + *	crc8_populate_msb(crc8_lookup_table, SDW_CRC8_POLY);
> > 
> > Good that you found this API, so next question would be why should we
> > have this static table in kernel and not generate on probe if bpt is
> > supported..? Many subsystems use these APIs to generate the tables..
> 
> The table is going to be the same for all hosts, it's simpler if
> everyone uses a constant table, no? We're talking about 256 bytes added
> for the common bus parts, be it with dynamically allocated memory or a
> static table.
> 
> I don't mind reverting to a dynamically allocated table populated at
> boot if that was the consensus.

Most of the kernel users I looked have dynamically allocated table
populated at boot, also out of many users how many would support BTP.?
Your older platforms, current qcom dont, so not point is adding for
everyone...


-- 
~Vinod
