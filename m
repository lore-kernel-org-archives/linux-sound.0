Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C6B360A1
	for <linux-sound@vger.kernel.org>; Thu, 21 Dec 2023 14:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aMiNkHkT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64839C433C7;
	Thu, 21 Dec 2023 14:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703169896;
	bh=qR/VUPzO8jIzabOI56INyptFUDjyYZAwRvCJFtLVKyo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aMiNkHkTa6ttUo2aNbk7SwpG13CIhLkIWTlm+/wgobEqqqYSJvluX9qgtw0QbMXLH
	 s6Z/mZ34KZRw74xF7k1lmwoLA0tM4hod8E71WH+7O7vwp74k0FsP9DJecMo3OCj4Jw
	 dGISynPcXXTSMJcjrmHwZmX6XTkkyMpHHx7rQMBies4akh8yNs0ro9eXcUXw1fxfYt
	 jOiYqTI32fjWcP6zA6vAwILeLZv5+cPaTtmcrKEk49gDbJlIQOVRvMjuBmlwyKQMzr
	 KYQrfncxD3gbIanjzIPdPdsENk2QqDwiXQy/DhEKDkFHTOi19pfhX1tDxfLV9GwUwC
	 QbX8tT4RkFizg==
Date: Thu, 21 Dec 2023 20:14:51 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
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
Message-ID: <ZYRPYwPlzCz3jWLc@matsya>
References: <20231207222944.663893-1-pierre-louis.bossart@linux.intel.com>
 <20231207222944.663893-2-pierre-louis.bossart@linux.intel.com>
 <ZYAvoFbEP8RH_x0Y@matsya>
 <a5d0e3a7-e45c-4971-8ad7-7ba19702acf1@linux.intel.com>
 <20231218142946.GZ14858@ediswmail.ad.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231218142946.GZ14858@ediswmail.ad.cirrus.com>

On 18-12-23, 14:29, Charles Keepax wrote:
> On Mon, Dec 18, 2023 at 01:58:47PM +0100, Pierre-Louis Bossart wrote:
> > > why not have a single API that does both? First check if it is supported
> > > and then allocate buffers and do the transfer.. What are the advantages
> > > of using this two step process
> > 
> > Symmetry is the only thing that comes to my mind. Open - close and send
> > - wait are natural matches, aren't they?
> > 
> > We do need a wait(), so bundling open() and send() would be odd.
> > 
> 
> I agree send->wait->close would be odd, But you just bundle close
> into wait. So the API becomes just send->wait, which seems pretty
> logical.

You would drop close as well, only send and wait...

> 
> > But you have a point that the open() is not generic in that it also
> > prepares the DMA buffers for transmission. Maybe it's more natural to
> > follow the traditional open(), hw_params(), hw_free, close() from ALSA.
> 
> I think this just makes it worse, you are now adding even more
> calls. The problem I see here is that, open and close (at least to
> me) strongly implies that you can do multiple operations between
> them and unless I have misunderstood something here you can't.
> 
> Thanks,
> Charles

-- 
~Vinod
