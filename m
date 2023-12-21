Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB2103608F
	for <linux-sound@vger.kernel.org>; Thu, 21 Dec 2023 14:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QpcJZq0z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A604C433C7;
	Thu, 21 Dec 2023 14:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703169587;
	bh=EfDpHN4WSMBhJVoFAooWZp4yWFs/ylynn70pHnqp8dg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QpcJZq0zvBsItx2hHM5ZlLjRWoH7xgvtc6E3L04RXa9mpRmGVtAB1vT/9Iy0anL2I
	 zDI7utMf50m9WUxfLVaQKN+k9CCcg8akfHAs07XzntMWsnyAVMJgL/mmhn941Tnepu
	 acXRbI3/3bh8eU7Yf09Wu6WFClu44NVQTETTsH2oXj6FCOuQzEzxN6+939hSI6/YEm
	 sFA1qP9beSHUaRv6BfIF9Zf7ZKhAtffd+jXMrSll3cHEfdX4cDcT2S8d9z6nvn8HYH
	 XJ5fnGObRbP0M/dcIXyvBSFJtTijNzU2ER50greGYZbJnWOum28rMpW2dxwrYFRClS
	 JBNIzvTJBEc/g==
Date: Thu, 21 Dec 2023 20:09:42 +0530
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
Subject: Re: [RFC PATCH 08/16] soundwire: bus: add bpt_stream pointer
Message-ID: <ZYROLuFZNdwGHReR@matsya>
References: <20231207222944.663893-1-pierre-louis.bossart@linux.intel.com>
 <20231207222944.663893-9-pierre-louis.bossart@linux.intel.com>
 <ZYAzS3tggqQg8_PW@matsya>
 <87b3fc89-f967-4251-b709-0d439c6f1cf7@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87b3fc89-f967-4251-b709-0d439c6f1cf7@linux.intel.com>

On 18-12-23, 14:20, Pierre-Louis Bossart wrote:
> 
> 
> On 12/18/23 05:55, Vinod Koul wrote:
> > On 07-12-23, 16:29, Pierre-Louis Bossart wrote:
> >> Add a convenience pointer to the 'sdw_bus' structure. BPT is a
> >> dedicated stream which will typically not be handled by DAIs or
> >> dailinks. Since there's only one BPT stream per link, storing the
> >> pointer at the link level seems rather natural.
> >>
> >> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> >> ---
> >>  include/linux/soundwire/sdw.h | 2 ++
> >>  1 file changed, 2 insertions(+)
> >>
> >> diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
> >> index e54c5bbd2b91..8db0cd7d0d89 100644
> >> --- a/include/linux/soundwire/sdw.h
> >> +++ b/include/linux/soundwire/sdw.h
> >> @@ -965,6 +965,7 @@ struct sdw_master_ops {
> >>   * @stream_refcount: number of streams currently using this bus
> >>   * @btp_stream_refcount: number of BTP streams currently using this bus (should
> >>   * be zero or one, multiple streams per link is not supported).
> >> + * @bpt_stream: pointer stored for convenience.
> >>   */
> >>  struct sdw_bus {
> >>  	struct device *dev;
> >> @@ -996,6 +997,7 @@ struct sdw_bus {
> >>  	int hw_sync_min_links;
> >>  	int stream_refcount;
> >>  	int bpt_stream_refcount;
> >> +	struct sdw_stream_runtime *bpt_stream;
> > 
> > So we are limiting to single stream? Can we have multiple transfers
> > queued up, which I guess might imply multiple streams?
> 
> 
> Yes for now there is a BTP/BRA single stream active when there are no
> audio transfers taking place. This is the only way to guarantee
> predictable download/resume times.
> 
> There is no mechanism to queue up transfers, be it from the same
> peripheral device or different ones. It would be up to the peripheral
> driver to wait for the BTP stream to be available.
> 
> Adding a queuing mechanism is a bridge too far for now, most platforms
> only have 1 or 2 devices only, and a peripheral driver may or may not be
> ok with delayed downloads. For now the main ask is to reduce download
> times, a single stream is already a good start. There are other
> refinements we need to add as well, such as changing clocks to use the
> fastest gear. I'd like to proceed with baby steps...

Since the API is async in nature, I think it is very reasonable that we
add the queue support (a simple list would do) and notify when the
transfer is complete..

-- 
~Vinod
