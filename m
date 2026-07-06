Received: from MTA-08-4.privateemail.com (mta-08-4.privateemail.com [198.54.122.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC4A423791;
	Mon,  6 Jul 2026 22:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.54.122.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783376576; cv=none; b=hdcmllzCArcQESNiikTKoW2H/gT+Aw6IbCr0Y+ClBrzmEEKQchWsoco+ctm9yHoivQyS48ff+GeWW9gIaE6/Ou4dO6xEufW8tIrrz3oafSPuy01PEVPZ7hrmjejNWvf2Pvm1vf7HIiOfkNemINh7PKPoW9cnEIFksJ2cAmcxlg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783376576; c=relaxed/simple;
	bh=UqZMSELsHwKu0xlfbRA60WE6Zr5hbjpWnBeS5arSfJI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H8svYmq5nMX1HLNNqW6QgCzsd3K35d+XCUiqujxR5gw1nOcmnJr99rQkg+yiq5+2UGOVGIC87RkysYUQPsTvDrIYUID9T7k90DrSxqJfqX/fc6aKGYXOL/oCHPiEke41fdyBw7HiFySTOeUPr/57w/T2rcLErDTrS/vKXu9iFVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=catcrafts.net; spf=pass smtp.mailfrom=catcrafts.net; arc=none smtp.client-ip=198.54.122.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=catcrafts.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=catcrafts.net
Received: from mail.privateemail.com (K8S-PROD-WORKER-10 [87.215.145.39])
	by mta-08.privateemail.com (Postfix) with ESMTPA id 4gvJkz0bgQz3hhTF;
	Mon,  6 Jul 2026 18:22:33 -0400 (EDT)
From: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
	Mark Brown <broonie@kernel.org>,
	Ravi Hothi <ravi.hothi@oss.qualcomm.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] ASoC: codecs: wcd9378: add TX/capture codec driver
Date: Tue,  7 Jul 2026 00:22:09 +0200
Message-ID: <20260706222209.180391-2-jorijnvdgraaf@catcrafts.net>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <ac214cce-ccb2-4b21-a02e-2fc7816766bb@kernel.org>
References: <20260706192229.144137-1-jorijnvdgraaf@catcrafts.net> <20260706192229.144137-4-jorijnvdgraaf@catcrafts.net> <ac214cce-ccb2-4b21-a02e-2fc7816766bb@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 6 Jul 2026 22:41:48 +0100, Srinivas Kandagatla wrote:
> Thanks Jorijn for sending these patches over.
>
> Was there a reason why RX not added?

Only that the Fairphone 6 gives me no way to test it: the phone has
no headset jack (hence MBHC being left out too), and its earpiece is
one of the two Awinic speaker amps in receiver mode rather than the
codec's EAR output - so none of the codec's analog outputs appears
to drive anything on this board. TX/capture was the feature the
phone was missing, and I did not want to send RX code I cannot
exercise on hardware.

> I have been working on adding an SDCA compliant driver for this codec
> for Glymur compute laptops just few weeks back, not fully ready yet.
>
> @Ravi has been working on the same codec for a non compute device
> (Eliza) and has made some good progress.
>
> As this is an SDCA compliant codec, there might be way to get both modes
> working with single driver (either with or without generic drivers),
> which is something that I will be exploring in parallel.

That is very good news. Two findings from the FP6 bring-up that will
matter for the SDCA-mode work as well:

 - The SDCA function engine does not survive bus clock-stop (details
   in the commit message): registers keep their values, but the
   sequencers ignore every subsequent power request and only a codec
   reset revives them. The downstream stack works around it with
   "qcom,is-always-on" on the TX master. Whatever driver shape this
   ends up with will need a story for that.

 - Register accesses above the 15-bit direct space need SCP address
   paging in the qcom controller, which mainline does not implement;
   I posted "soundwire: qcom: add SCP address paging support"
   (20260706192150.143921-1-jorijnvdgraaf@catcrafts.net) alongside
   this series. The Glymur and Eliza drivers will need that too:
   all of the chip's codec control registers - SDCA functions and
   analog core alike - sit above the 15-bit direct space.

> Overall Looks like we could bring everything together to add better
> support for this codec.
>
> In the meantime Myself and Ravi will continue to test this codec along
> with other changes and get back

Sounds like a plan. I'll hold v2 for now so it can take a shape
that fits the single-driver direction; if the testing takes a while
I'll respin with the review fixes collected so far and we can
converge from there. The Fairphone 6 is a readily available retail
device, so consider it a standing test vehicle for the mobile
split-slave mode - happy to test patches on it.

Thanks,
Jorijn
