Return-Path: <linux-sound-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8297C2BB3F
	for <linux-sound@archiver.kernel.org>; Wed, 15 Nov 2023 20:40:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235689AbjKOUkQ (ORCPT <rfc822;linux-sound@archiver.kernel.org>);
        Wed, 15 Nov 2023 15:40:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235693AbjKOUkD (ORCPT
        <rfc822;linux-sound@vger.kernel.org>);
        Wed, 15 Nov 2023 15:40:03 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6383F172A
        for <linux-sound@vger.kernel.org>; Wed, 15 Nov 2023 12:39:40 -0800 (PST)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40B5AC433C7;
        Wed, 15 Nov 2023 20:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1700080780;
        bh=a4uLY3fIHjIzDckMdLNrHHH7XSdcsX+bPwoA2MErrtQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qoik11g4gNU1aUqgSjzeEpuYyRrJKFcqy38dEg3ZYGo4cmT27NuU7nx/I6p53p5nH
         57G4wRKv9JoRW57oi5UJBFVQNW5aEmmolLLRJ36sy3CG3VXKH01BrC5cicvQk8VYQt
         5SEWrbdT1oZMi8RK4TAx73/5RDKHapkujQUzI5ydj4w3NatL0sAi7NgVY9D9BDBGD9
         EDzv82RiFlkC0oUjSOYYm6cbchHjBTh3ElvzYd1EqIh+lCMIHlZzEysFckIBFmmbR0
         H0O9bB0iRqh/I0H+kO6avWOzRBWZIFfhKeCjiGElcF7RjSGfovjMiuye5FiDBT8jWw
         CMa76D7v1XgBg==
Date:   Wed, 15 Nov 2023 20:39:35 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Cezary Rojewski <cezary.rojewski@intel.com>
Cc:     tiwai@suse.com, perex@perex.cz, alsa-devel@alsa-project.org,
        amadeuszx.slawinski@linux.intel.com,
        pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com,
        linux-sound@vger.kernel.org
Subject: Re: [PATCH v3 00/16] ALSA/ASoC: hda: Address format selection
 limitations and ambiguity
Message-ID: <2306e2e1-b665-4dbc-91ce-a31e062f06bf@sirena.org.uk>
References: <20231114201317.1348066-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="t2eW1j2ZDPlKeZe5"
Content-Disposition: inline
In-Reply-To: <20231114201317.1348066-1-cezary.rojewski@intel.com>
X-Cookie: For internal use only.
Precedence: bulk
List-ID: <linux-sound.vger.kernel.org>
X-Mailing-List: linux-sound@vger.kernel.org


--t2eW1j2ZDPlKeZe5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 14, 2023 at 09:13:01PM +0100, Cezary Rojewski wrote:
> Patchset aims to address format selection restrictions present currently
> in the HDAudio library. Formats which we are concerned about are 20 and
> 24 valid bits per sample within 32 bit depth container. One may identify
> them as S20_LE and S24_LE except that those, according to comments found
> in include/uapi/sound/asound.h, are for LSB-aligned scenarios. HDAudio
> streams expect MSB-aligned data, no matter if we are speaking of HOST
> (SDxFMT) or LINK (PPLCxFMT) side - chapter 4.5.1 of the public HDAudio
> specification. In short, S20_LE and S24_LE are invalid options.

Acked-by: Mark Brown <broonie@kernel.org>

--t2eW1j2ZDPlKeZe5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmVVLIYACgkQJNaLcl1U
h9AY/Qf/TN1EqWVx9qTD9pudDMK8HzSZoVKOW35AmAyge5R/pb7SZ/eXe1/1kh7t
/67MhOj9tUn95YiqmetoxJ7Ahc3Gij9mOpdz0ysRCToydnBqhW9z1Qeipz8NXKCX
vz3D6G7wWOhlDlPrzqN21lFhyFM2XaEiV+bMZBp8nDCpf39LizlC8tXbc9J/Wsuj
w6qP8AMQS8+M4lr+uJHOLz9tqzwGa8Db8ToOzOAW5K7xe6XijiXvkHIzlbvpMoln
JH7LrJHpbxmLfqfdke0vTXraHBAsb5fhY/ak0AijCY/REWjph/myNW7N2Ku1ofp9
J6Qx8abCQyNN0Ka4yVXtt/JVfL8UKw==
=1aO0
-----END PGP SIGNATURE-----

--t2eW1j2ZDPlKeZe5--
