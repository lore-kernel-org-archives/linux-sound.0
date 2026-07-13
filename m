Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A3034C9AD
	for <linux-sound@vger.kernel.org>; Mon, 13 Jul 2026 18:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783965789; cv=none; b=W6l5643n9p++bwCtthXANBo0sTjH/2TkwF48nJY9DURWeNptcCQI3sLZFCwFNPU4iGjizbH5idWeujF6yS+aCc9Sun7gilR3dCphyuAgu072Rd8r6bIepSJk0iLz0O3ZUWH1G/iCn2O9QFEPBAQIhLurk78CImGYJ+cSaKkwI0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783965789; c=relaxed/simple;
	bh=WDAY2RkX8or/i5iX/YtFdUUtVdDdEi7hqVtoDMd022M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IqwHHtOXazse5b/hM9CK0k6YHIZ31IhMDmTbSoeBQt9GAjv1niAdWCyM8JJ5pK7DeL5/QaTWLxE4QmU8tR1OY1pxezyUJjdydwA4ewLSD3CXvNFor6Djve8gqZB+wXdt303BI2rfkL7XYbQZskBaZH8uLk5fVEIPMaigP7BbmKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=efbUNRFz; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="efbUNRFz"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=2HLWco+auesEEtU+LD0I3Nh6fGgcUOAea5Gr//Ds+pI=; b=efbUNRFzvz8CFdvKSB5o3bxy62
	gVJtBm6AXKd4CjivP5Ql8hlum4ncYJskJDSz70aUukz2CbVP/aQZ47OGNewwm7+X1qgehT1QV1C2E
	MQUBm9Q+VhV0nd0eNw9ygpVFSYZf2gibygNPwoVOvEMF6oetI8s8kzsQErtP3hxbuSornYUujTcSa
	PjK6kmL2WTmhVGFyGgI7PrUcOQAM4dCPG6X36r+SaaytZCTmWa+KJFT9/n/O0C2VXRuFVSDZwbST6
	LtLFGL7IZLml4w32B7NFmnB5lQs7Ugoy1dgUAx2/0x0u5orsYT+oRttafnkfuEyVhex3gDT4DByOe
	a30yRa0A==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjKzi-0000000AAVv-3c0E;
	Mon, 13 Jul 2026 18:03:06 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-sound@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 3/4] ALSA: firewire: fix all kernel-doc warnings
Date: Mon, 13 Jul 2026 11:03:02 -0700
Message-ID: <20260713180303.526409-4-rdunlap@infradead.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260713180303.526409-1-rdunlap@infradead.org>
References: <20260713180303.526409-1-rdunlap@infradead.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing comment for struct member @messages.
Use the struct keyword for a struct's kernel-doc heading.
Add missing comments for nested aggregate structs.
Repair some typos.

Warning: include/uapi/sound/firewire.h:97 struct member 'messages' not described in 'snd_firewire_event_ff400_message'
Warning: ../include/uapi/sound/firewire.h:220 cannot understand function prototype: 'struct snd_firewire_motu_register_dsp_parameter'

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>

 include/uapi/sound/firewire.h |   24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

--- linext-2026-0710.orig/include/uapi/sound/firewire.h
+++ linext-2026-0710/include/uapi/sound/firewire.h
@@ -79,11 +79,12 @@ struct snd_firewire_event_motu_register_
  *
  * @type: Fixed to SNDRV_FIREWIRE_EVENT_FF400_MESSAGE.
  * @message_count: The number of messages.
+ * @messages: Array of @message_count messages
  * @messages.message: The messages expressing hardware knob operation.
  * @messages.tstamp: The isochronous cycle at which the request subaction of asynchronous
- *		     transaction was sent to deliver the message. It has 16 bit unsigned integer
+ *		     transaction was sent to deliver the message. It has 16-bit unsigned integer
  *		     value. The higher 3 bits of value expresses the lower three bits of second
- *		     field in the format of CYCLE_TIME, up to 7. The rest 13 bits expresses cycle
+ *		     field in the format of CYCLE_TIME, up to 7. The remaining 13 bits express cycle
  *		     field up to 7999.
  *
  * The structure expresses message transmitted by Fireface 400 when operating hardware knob.
@@ -191,8 +192,9 @@ struct snd_firewire_motu_register_dsp_me
 #define SNDRV_FIREWIRE_MOTU_REGISTER_DSP_ALIGNED_INPUT_COUNT	(SNDRV_FIREWIRE_MOTU_REGISTER_DSP_INPUT_COUNT + 2)
 
 /**
- * snd_firewire_motu_register_dsp_parameter - the container for parameters of DSP controlled
- *					      by register access.
+ * struct snd_firewire_motu_register_dsp_parameter - the container for parameters
+ *                                                   of DSP controlled by register access.
+ * @mixer: aggregate of @mixer.source and @mixer.output
  * @mixer.source.gain: The gain of source to mixer.
  * @mixer.source.pan: The L/R balance of source to mixer.
  * @mixer.source.flag: The flag of source to mixer, including mute, solo.
@@ -200,21 +202,25 @@ struct snd_firewire_motu_register_dsp_me
  *				 Audio Express.
  * @mixer.source.paired_width: The width of paired source to mixer, only for 4 pre and
  *			       Audio Express.
+ * @mixer.output: FIXME
  * @mixer.output.paired_volume: The volume of paired output from mixer.
  * @mixer.output.paired_flag: The flag of paired output from mixer.
+ * @output: output parameters
  * @output.main_paired_volume: The volume of paired main output.
  * @output.hp_paired_volume: The volume of paired hp output.
  * @output.hp_paired_assignment: The source assigned to paired hp output.
- * @output.reserved: Padding for 32 bit alignment for future extension.
+ * @output.reserved: Padding for 32-bit alignment for future extension.
+ * @line_input: line input parameters
  * @line_input.boost_flag: The flags of boost for line inputs, only for 828mk2 and Traveler.
  * @line_input.nominal_level_flag: The flags of nominal level for line inputs, only for 828mk2 and
  *				   Traveler.
- * @line_input.reserved: Padding for 32 bit alignment for future extension.
+ * @line_input.reserved: Padding for 32-bit alignment for future extension.
+ * @input: input parameters
  * @input.gain_and_invert: The value including gain and invert for input, only for Ultralite, 4 pre
  *			   and Audio Express.
  * @input.flag: The flag of input; e.g. jack detection, phantom power, and pad, only for Ultralite,
  *		4 pre and Audio express.
- * @reserved: Padding so that the size of structure is kept to 512 byte, but for future extension.
+ * @reserved: Padding so that the size of structure is kept to 512 bytes, but for future extension.
  *
  * The structure expresses the set of parameters for DSP controlled by register access.
  */
@@ -272,8 +278,8 @@ struct snd_firewire_motu_register_dsp_pa
  *						controlled by command
  * @data: Signal level meters. The mapping between position and signal channel is model-dependent.
  *
- * The structure expresses the part of DSP status for hardware meter. The 32 bit storage is
- * estimated to include IEEE 764 32 bit single precision floating point (binary32) value. It is
+ * The structure expresses the part of DSP status for hardware meter. The 32-bit storage is
+ * estimated to include IEEE 764 32-bit single precision floating point (binary32) value. It is
  * expected to be linear value (not logarithm) for audio signal level between 0.0 and +1.0.
  */
 struct snd_firewire_motu_command_dsp_meter {
