Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25E31D6BD
	for <linux-sound@vger.kernel.org>; Thu, 21 Dec 2023 14:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="twNJ0TxK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E23DDC433C8;
	Thu, 21 Dec 2023 14:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703169938;
	bh=9rUMqr3K4HJZTAFenjHNt1RV6itpPVxCJDKk8eXJ70Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=twNJ0TxK/ZrNUOVV40ykRbbBjBf3fBhJLAizFgMQkg3d3vtHFzLECRnsKnCJD30LS
	 GH4bJX0g0rMfL5KgAOhlhPWSyjuitVGd00pA6i86SRN4VCO70AbSx+SjiVrrtaQZLQ
	 Vbt3n9691Rhb6zT5VraThHf/aSUGnxfEWIG/tl7oeOnH35K5aQjhsBsuvfhFSJI+XQ
	 fJQe2uTVtrJNfqLNW++rOw9YIRMdCB5MTVhRloTgmkI6PrF/vxvNmUP64st3yfObYG
	 MZ8m4JpOgCnOlSNM1KQ+2QwwMtjBeiMxTPBm6Kir9QitqQ+XYNfXnBXy5yxNql+lM2
	 15wgtx65QIhJQ==
Date: Thu, 21 Dec 2023 20:15:34 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>,
	linux-sound@vger.kernel.org, alsa-devel@alsa-project.org,
	tiwai@suse.de, broonie@kernel.org, vinod.koul@intel.com,
	Bard liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	srinivas.kandagatla@linaro.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	vijendar.mukunda@amd.com,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Shuming Fan <shumingf@realtek.com>, Jack Yu <jack.yu@realtek.com>,
	Oder Chiou <oder_chiou@realtek.com>
Subject: Re: [RFC PATCH 01/16] Documentation: driver: add SoundWire BRA
 description
Message-ID: <ZYRPjsLI1zZl6nqe@matsya>
References: <20231207222944.663893-1-pierre-louis.bossart@linux.intel.com>
 <20231207222944.663893-2-pierre-louis.bossart@linux.intel.com>
 <ZYAvoFbEP8RH_x0Y@matsya>
 <a5d0e3a7-e45c-4971-8ad7-7ba19702acf1@linux.intel.com>
 <20231218142946.GZ14858@ediswmail.ad.cirrus.com>
 <a4bfdc56-b323-4c13-a09e-c0f5baf40450@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a4bfdc56-b323-4c13-a09e-c0f5baf40450@linux.intel.com>

On 18-12-23, 17:33, Pierre-Louis Bossart wrote:
> 
> 
> On 12/18/23 08:29, Charles Keepax wrote:
> > On Mon, Dec 18, 2023 at 01:58:47PM +0100, Pierre-Louis Bossart wrote:
> >>> why not have a single API that does both? First check if it is supported
> >>> and then allocate buffers and do the transfer.. What are the advantages
> >>> of using this two step process
> >>
> >> Symmetry is the only thing that comes to my mind. Open - close and send
> >> - wait are natural matches, aren't they?
> >>
> >> We do need a wait(), so bundling open() and send() would be odd.
> >>
> > 
> > I agree send->wait->close would be odd, But you just bundle close
> > into wait. So the API becomes just send->wait, which seems pretty
> > logical.
> 
> Fair enough, send()/wait() would work indeed.
> 
> I guess I wanted to keep the callbacks reasonably small (already 200
> lines for the open), but we can split the 'send' callback into smaller
> helpers to keep the code readable. There's no good reason to expose
> these smaller helpers to codec drivers.

Yes! that would be a better design IMO

> 
> >> But you have a point that the open() is not generic in that it also
> >> prepares the DMA buffers for transmission. Maybe it's more natural to
> >> follow the traditional open(), hw_params(), hw_free, close() from ALSA.
> > 
> > I think this just makes it worse, you are now adding even more
> > calls. The problem I see here is that, open and close (at least to
> > me) strongly implies that you can do multiple operations between
> > them and unless I have misunderstood something here you can't.
> 
> That's right, the open was not compatible with multiple operations.
> Collapsing open/send and wait/close sounds more logical, thanks for the
> feedback.

Sure

-- 
~Vinod
