Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F03F38944C
	for <linux-sound@vger.kernel.org>; Mon,  2 Feb 2026 17:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770054794; cv=none; b=BJ9HYBpdw9P7tZOIquuRsySqP7eT9Av3vEWygKxG1io/XIta5wrKaHAPVO7PScCFEqnaa1cH6FWl/c73I7HGMLjMqZgEVShJ2d085zkLlt3lnksIZmIyut5bOtu0cXDBynzVovsntlx7d7gPjth6SNYmDJGZu1IeiMsZkUHGmiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770054794; c=relaxed/simple;
	bh=7kxye65VCI+h5vlPs0yvkT/19UOY1PNPUa2UQ4bXrDo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=lsDJuzPyMq4pyzH7omGIlF4y9RJp5JRGvP3qqeboRGpYUeE9WWPij8F8R6h+ozMPqDAQBMalBDU31TOeDO4D420IeXcwA6QRDqLITL5Pmdoonmc60KGdNpQuKCNkpGhbphatMtwYaGMmYwRRBPm3AkbFTQz0xC8RwyQvbfl1/7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com; spf=pass smtp.mailfrom=korsgaard.com; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=QfW1jbja; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=korsgaard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="QfW1jbja"
DKIM-Signature: a=rsa-sha256; b=QfW1jbjatg2bVdWxDvuz5A/nLWLsTXHi7UxA9Q21rB27IhSdYu3WJD+dr3KUFitWvEIcjvbhqO6gmjZuhEqelZoOkv8Vr0bZX9vPYhYZX9PnZUK3oQ4KNB3sdDnO+ZgCrqVoLtIi+Vl/mKbVkz4YZKAWHxgHk8ouRCIZULTgOd9Nk6sKSASnnWEM6fUqNUTA8a7IR4hArRyFS6kaJC1rKfC7rmLQM+uVbm7CkRj+yaNXKhkH5uR/3RjP16NnBWqW2zFBjygi5D+42DAQ7x2N43deYb/KJQ5rEFpKNzElhSrsohYcLKYkmBZiJYdV3bub18ZUQLftE45fgYSKWt/vRA==; s=purelymail2; d=purelymail.com; v=1; bh=7kxye65VCI+h5vlPs0yvkT/19UOY1PNPUa2UQ4bXrDo=; h=Feedback-ID:Received:Received:From:To:Subject:Date;
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: linux-sound@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -938854233;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Mon, 02 Feb 2026 17:52:31 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
	(envelope-from <peter@korsgaard.com>)
	id 1vmy67-00000007HHQ-3gE8;
	Mon, 02 Feb 2026 18:52:27 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Mark Brown <broonie@kernel.org>
Cc: Sean Anderson <sean.anderson@linux.dev>,  Vincenzo Frascino
 <vincenzo.frascino@arm.com>,  Liam Girdwood <lgirdwood@gmail.com>,
  linux-sound@vger.kernel.org,  Jaroslav Kysela <perex@perex.cz>,
  linux-kernel@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  Michal Simek <michal.simek@amd.com>,  Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH 2/2] ASoC: xilinx: xlnx_i2s: Discover parameters from
 registers
In-Reply-To: <06b3d7e0-27b5-433c-85db-23e4c5ef5472@sirena.org.uk> (Mark
	Brown's message of "Thu, 29 Jan 2026 18:46:23 +0000")
References: <20260129172315.3871602-1-sean.anderson@linux.dev>
	<20260129172315.3871602-3-sean.anderson@linux.dev>
	<700e4e67-a2ed-4b37-a00b-303bbc5ee6cd@sirena.org.uk>
	<a95d7feb-4d94-4b25-be96-c7c367342c19@linux.dev>
	<a17602f1-537e-46e6-a85d-8a005a0443a2@sirena.org.uk>
	<21a738e6-6585-4479-b797-f8b17df91aed@linux.dev>
	<06b3d7e0-27b5-433c-85db-23e4c5ef5472@sirena.org.uk>
Date: Mon, 02 Feb 2026 18:52:27 +0100
Message-ID: <87jywvvxr8.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

>>>>> "Mark" == Mark Brown <broonie@kernel.org> writes:

Hi,

 >> and go "Ah, there are the properties I need." On some Xilinx cores this
 >> is the only way to discover certain properties, so people have gotten into
 >> the habit of using them even when these properties can be read from the
 >> device itself.

 > Oh.  If the properties are there it's reasonable and sensible to use
 > them, them being redundant is a concern when specifying the binding but
 > once things are there any discrepency should usually be resolved in
 > favour of the binding.

I also think making the hardware registers take priority over the DTS
makes sense (E.G. what this patch does), as the DTS can get out of sync
with the (programmable) HW configuration if the FPGA config is changed
and a DTS update is forgotten.


 >> I would rather remove it for the code size reduction and simplication.

 > We're talking a couple of function calls with no error handling here,
 > I'm not sure anyone concerned about that kind of impact is running
 > Linux.

Agreed, but the HW registers should by definition always be in sync with
the IP block configuration, where the DTS update involves a manual
update so it may not, so the HW registers are more reliable than the DTS.

-- 
Bye, Peter Korsgaard
