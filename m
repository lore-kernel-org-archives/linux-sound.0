Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28DDE39863
	for <linux-sound@vger.kernel.org>; Mon, 18 Dec 2023 11:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AELLgjZw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E730EC433C7;
	Mon, 18 Dec 2023 11:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702899621;
	bh=uPQEOc5Zgz5g44nukLkiI4sq8EFh+IPAn/hUt5T+gDE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AELLgjZwRNqa5Ut9XG3o3XvJ/tWd5EXzvy+cHriyoorOtmOrMz9rFLpRSuB1UpgVR
	 ym2k1F07rkdXVE7eXcHSllmmqqFyt42dI7+bKaxaprPTATTPkbCpDTsKz2JFOu6HEZ
	 5yxcQUA++nVp6I3bKMN0AjNQOJkGdpi3v/GcwX1xi/kmiHAwp72xVkMi4O5pBxyuDK
	 slZu/VXhH1XFfmBCR3oEfg0RQ9ngadCy0O0wGnkTmpXdRYNU1SH1IiKus1BBYOoD0Q
	 X/j9Y8BlOrA3IPlxu7LAP52QQviI/XKw4xdg4HDQ7dAayn5qC2+pPBHNuL2+FbW1qH
	 WEM6CjG0E1BdA==
Date: Mon, 18 Dec 2023 17:10:16 +0530
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
Subject: Re: [RFC PATCH 01/16] Documentation: driver: add SoundWire BRA
 description
Message-ID: <ZYAvoFbEP8RH_x0Y@matsya>
References: <20231207222944.663893-1-pierre-louis.bossart@linux.intel.com>
 <20231207222944.663893-2-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231207222944.663893-2-pierre-louis.bossart@linux.intel.com>

Hi Pierre,

On 07-12-23, 16:29, Pierre-Louis Bossart wrote:
> The Bulk Register Access protocol was left as a TODO topic since
> 2018. It's time to document this protocol and the design of its Linux
> support.

Thanks for letting me know about this thread. At least now with B4 we
can grab threads we are not copied.

> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>  Documentation/driver-api/soundwire/bra.rst    | 478 ++++++++++++++++++

Can we split the cadence parts of this to bra-cadence.rst that way this
file documents the core parts only

> +Concurrency between BRA and regular read/write
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +The existing 'nread/nwrite' API already relies on a notion of start
> +address and number of bytes, so it would be possible to extend this
> +API with a 'hint' requesting BPT/BRA be used.
> +
> +However BRA transfers could be quite long, and the use of a single
> +mutex for regular read/write and BRA is a show-stopper. Independent
> +operation of the control/command and BRA transfers is a fundamental
> +requirement, e.g. to change the volume level with the existing regmap
> +interface while downloading firmware.
> +
> +This places the burden on the codec driver to verify that there is no
> +concurrent access to the same address with the command/control
> +protocol and the BRA protocol.
> +
> +In addition, the 'sdw_msg' structure hard-codes support for 16-bit
> +addresses and paging registers which are irrelevant for BPT/BRA
> +support based on native 32-bit addresses. A separate API with
> +'sdw_bpt_msg' makes more sense.
> +
> +One possible strategy to speed-up all initialization tasks would be to
> +start a BRA transfer for firmware download, then deal with all the
> +"regular" read/writes in parallel with the command channel, and last
> +to wait for the BRA transfers to complete. This would allow for a
> +degree of overlap instead of a purely sequential solution. As a
> +results, the BRA API must support async transfers and expose a
> +separate wait function.

That sounds logical to me

> +
> +Error handling
> +~~~~~~~~~~~~~~
> +
> +The expected response to a 'bra_message' and follow-up behavior may
> +vary:
> +
> +   (1) A Peripheral driver may want to receive an immediate -EBUSY
> +       response if the BRA protocol is not available at a given time.
> +
> +   (2) A Peripheral driver may want to wait until a timeout for the
> +       on-going transfer to be handled
> +
> +   (3) A Peripheral driver may want to wait until existing BRA
> +       transfers complete or deal with BRA as a background task when
> +       audio transfers stop. In this case, there would be no timeout,
> +       and the operation may not happen if the platform is suspended.

Is this runtime suspend or S3/S4 case?

> +BTP/BRA API available to peripheral drivers
> +-------------------------------------------
> +
> +ASoC Peripheral drivers may use
> +
> +   - sdw_bpt_stream_open(mode)
> +
> +      This function verifies that the BPT protocol with the
> +      'mode'. For now only BRA is accepted as a mode. This function
> +      allocates a work buffer internally. This buffer is not exposed
> +      to the caller.
> +
> +     errors:
> +         -ENODEV: BPT/BRA is not supported by the Manager.
> +
> +         -EBUSY: another agent is already using the audio payload for
> +          audio transfers. There is no way to predict when the audio
> +          streams might stop, this will require the Peripheral driver
> +          to fall back to the regular (slow) command channel.
> +
> +         -EAGAIN: another agent is already transferring data using the
> +          BPT/BRA protocol. Since the transfers will typically last
> +          10s or 100s of ms, the Peripheral driver may wait and retry
> +          later.
> +
> +    - sdw_bpt_message_send_async(bpt_message)

why not have a single API that does both? First check if it is supported
and then allocate buffers and do the transfer.. What are the advantages
of using this two step process

-- 
~Vinod
