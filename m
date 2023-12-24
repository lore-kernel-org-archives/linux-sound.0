Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D38D2FD
	for <linux-sound@vger.kernel.org>; Sun, 24 Dec 2023 19:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b="uqDln1Hk"
Received: by m.b4.vu (Postfix, from userid 1000)
	id 30575604B9CB; Mon, 25 Dec 2023 06:00:29 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu 30575604B9CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1703446229; bh=BpM0d/U+/XXah+AUVCKPlhYL60EcBOcx8sRcwlr1kRc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uqDln1HkmWWH+11Sxda2WScABOtTqm0ycNN3wMffpXxjbbjuNNDJdHbBFDDnSkhAJ
	 aZ2k88NKoGdgQtxbzMgK8d8+WntsyisZDFTe5CdaY8eiISi4IbBowz9qLokhgpoT7c
	 h5V4x2eD7oFRkYKlt3lj2dGbRYYZi0WL9/x4yXVEF3lVbJAUpdTHcodYh/Ea9u1hGk
	 vuA+Cpca3CXrx1K27uHc5n00nqea857kojIOUbJACem7LxVr2Ct1wKVKtj4fFSF1Id
	 kpHZn/mV11Yu57YURjEtxrQEOysnUcuPA7AjTPMvDhzUG6xxftH2QeVGOBS2n/692v
	 oI3DYrGahWcdQ==
Date: Mon, 25 Dec 2023 06:00:29 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 20/23] ALSA: scarlett2: Add #define for SCARLETT2_MIX_MAX
Message-ID: <83cec5ccd75f0db2bd061a76d31a7023d26300c1.1703444932.git.g@b4.vu>
References: <cover.1703444932.git.g@b4.vu>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1703444932.git.g@b4.vu>

Add a #define for SCARLETT2_MIX_MAX (max of mixer inputs * outputs) as
that will be used again soon.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett2.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index efe95a25998b..186d6d04381c 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -208,6 +208,9 @@ static const u16 scarlett2_mixer_values[SCARLETT2_MIXER_VALUE_COUNT] = {
 /* Maximum number of outputs from the mixer */
 #define SCARLETT2_OUTPUT_MIX_MAX 12
 
+/* Maximum number of mixer gain controls */
+#define SCARLETT2_MIX_MAX (SCARLETT2_INPUT_MIX_MAX * SCARLETT2_OUTPUT_MIX_MAX)
+
 /* Maximum size of the data in the USB mux assignment message:
  * 20 inputs, 20 outputs, 25 matrix inputs, 12 spare
  */
@@ -719,7 +722,7 @@ struct scarlett2_data {
 	struct snd_kcontrol *speaker_switching_ctl;
 	struct snd_kcontrol *talkback_ctl;
 	u8 mux[SCARLETT2_MUX_MAX];
-	u8 mix[SCARLETT2_INPUT_MIX_MAX * SCARLETT2_OUTPUT_MIX_MAX];
+	u8 mix[SCARLETT2_MIX_MAX];
 };
 
 /*** Model-specific data ***/
-- 
2.43.0

