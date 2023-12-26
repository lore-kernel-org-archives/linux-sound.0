Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A1545025C
	for <linux-sound@vger.kernel.org>; Tue, 26 Dec 2023 18:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b="Ojj7sBnB"
Received: by m.b4.vu (Postfix, from userid 1000)
	id 240FC604B1E4; Wed, 27 Dec 2023 04:38:34 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu 240FC604B1E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1703614114; bh=Z1wypPWyRwmNOqYEnSJ9Ayq84v0l+X7IAUmsB3CMjQA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ojj7sBnBy9qGcmhYbcLah13c7i8VbTeVCiRB3mzkOid5K/EqJR8hjUJ3ttfgKQEYZ
	 gmtThMd9OFoS0yJIka2/fu3Mcui96jJMEFXddCLdXCNbJfB6nwmEBvAfToaF7Ahdm0
	 ZlnGgJaLvdg856HwSjxCXAMvyTFNylspJSjomzjJLi+QvD6l2UN3ODZRUj2RKldRtI
	 dHSkxSge/MgXqdphxIsVl/xXd85M5ltc8tM5Dbt9YIvsQC6e7/z3ConjBUJUQSY6ak
	 q43S92WzwbepaI4z/9BeSKWvyC5C9Jd+nBOoxuLH4sJzElB6Hom277EhW4yVFLtfmZ
	 44DOCPyBsNNNw==
Date: Wed, 27 Dec 2023 04:38:34 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 15/20] ALSA: scarlett2: Add support for DSP mux channels
Message-ID: <b78bdb1a7624d55783f5bf0e1ffbfa47a9e9a800.1703612638.git.g@b4.vu>
References: <cover.1703612638.git.g@b4.vu>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1703612638.git.g@b4.vu>

The DSP mux channels in the Scarlett 4th Gen appear as
SCARLETT2_PORT_TYPE_MIX ports but do not have corresponding mixer
controls. Add a dsp_count option to the device info struct to exclude
those DSP channels from the num_mix_in/num_mix_out counts.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett2.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index 1c6a493eb2ee..5ac31fea9831 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -706,6 +706,9 @@ struct scarlett2_device_info {
 	 */
 	u8 direct_monitor;
 
+	/* the number of DSP channels */
+	u8 dsp_count;
+
 	/* remap analogue outputs; 18i8 Gen 3 has "line 3/4" connected
 	 * internally to the analogue 7/8 outputs
 	 */
@@ -5827,12 +5830,17 @@ static void scarlett2_count_io(struct scarlett2_data *private)
 	private->num_mux_srcs = srcs;
 	private->num_mux_dsts = dsts;
 
-	/* Mixer inputs are mux outputs and vice versa */
+	/* Mixer inputs are mux outputs and vice versa.
+	 * Scarlett Gen 4 DSP I/O uses SCARLETT2_PORT_TYPE_MIX but
+	 * doesn't have mixer controls.
+	 */
 	private->num_mix_in =
-		port_count[SCARLETT2_PORT_TYPE_MIX][SCARLETT2_PORT_OUT];
+		port_count[SCARLETT2_PORT_TYPE_MIX][SCARLETT2_PORT_OUT] -
+			info->dsp_count;
 
 	private->num_mix_out =
-		port_count[SCARLETT2_PORT_TYPE_MIX][SCARLETT2_PORT_IN];
+		port_count[SCARLETT2_PORT_TYPE_MIX][SCARLETT2_PORT_IN] -
+			info->dsp_count;
 
 	/* Number of analogue line outputs */
 	private->num_line_out =
-- 
2.43.0

