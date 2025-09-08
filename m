Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com [95.215.58.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0322FCBFD
	for <linux-sound@vger.kernel.org>; Mon,  8 Sep 2025 12:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757333684; cv=none; b=RO/v+wrItewXsN53HKqX43W8goZUMgufKFk+FVXZPlaJjeK9wRFHn4ctytmi8E0P60qzAaXbNhuEUE4W1cBhyGznc7Hve9fT2EkXXiC+q+xMvGaPldE/lfru8OwhODZKS2RLDWR66XcgSkGhn259ISEhSfl1GTSuX/GDwOJycps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757333684; c=relaxed/simple;
	bh=H6Q1hoLQNb+usPCdAVlEUPAAshjZwIn70ux0qgUZldo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fx77yeXSne7oGAz5YKP3ceu8OZVF+J3IC8ivsQQePOSuNJ095dcT6RIMSY1CnIH7aoII4QHbIBSwMhZUgGra8BqzcrEtutB1aG6q1yQ2VZE4JG9uRYFblvTGzkrLxNOIEdv1zrmaaZlwfFvwLfLnFekPtrKaRhRY+KxDESV5E3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=WGshOh2P; arc=none smtp.client-ip=95.215.58.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="WGshOh2P"
Message-ID: <e85fa12d-727c-402b-a7c1-493d2224f228@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1757333680;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xbF3j9evb+hpMPWVP3mk3KIKSxbT6BYzaBADBpepqao=;
	b=WGshOh2PHrLJv6kaPxeVR2vc3++YFlpGZQXoYyxqTlmftLqpSGi1vqci4HQojKD9mVZCRs
	XjO+X76FVvyaffQi9IOFWgedsJ85Zy4UGJ7SdbklU6Q0PcwWdqbo5opHoREIs4BBNSEPmj
	eaQ2dzjtpTlNUCzJyfTisIzsgCfe4dU=
Date: Mon, 8 Sep 2025 14:02:09 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 09/15] ASoC: SDCA: Add UMP buffer helper functions
To: Charles Keepax <ckeepax@opensource.cirrus.com>, broonie@kernel.org
Cc: rafael@kernel.org, yung-chuan.liao@linux.intel.com,
 peter.ujfalusi@linux.intel.com, shumingf@realtek.com, lgirdwood@gmail.com,
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com
References: <20250905143123.3038716-1-ckeepax@opensource.cirrus.com>
 <20250905143123.3038716-10-ckeepax@opensource.cirrus.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20250905143123.3038716-10-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 9/5/25 16:31, Charles Keepax wrote:
> Add helper functions for handling Universal Message Passing (UMP)
> buffers on SDCA devices. These are generic mechanisms to pass blocks of
> binary data between the host and the device, in both directions. They
> are used for things like passing HID descriptors and the File Download
> process.

Humm, these helpers are very host-centric and don't seem to cover the basic UMP message passing, e.g. for host to device:

1. host puts information in a buffer.
2. host sets ownership to device and waits for ownership to be returned.
3. device does a bunch of things and returns the ownership to the host.
4. host detects ownership change or times out with a failed transfer error message.

What am I missing?

> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---
>  include/sound/sdca_function.h |  26 ++++
>  include/sound/sdca_ump.h      |  45 +++++++
>  sound/soc/sdca/Makefile       |   3 +-
>  sound/soc/sdca/sdca_ump.c     | 247 ++++++++++++++++++++++++++++++++++
>  4 files changed, 320 insertions(+), 1 deletion(-)
>  create mode 100644 include/sound/sdca_ump.h
>  create mode 100644 sound/soc/sdca/sdca_ump.c
> 
> diff --git a/include/sound/sdca_function.h b/include/sound/sdca_function.h
> index ab9af84082c95..341912d896679 100644
> --- a/include/sound/sdca_function.h
> +++ b/include/sound/sdca_function.h
> @@ -133,6 +133,32 @@ struct sdca_init_write {
>  #define SDCA_CTL_TYPE_S(ent, sel) SDCA_CTL_TYPE(SDCA_ENTITY_TYPE_##ent, \
>  						SDCA_CTL_##ent##_##sel)
>  
> +/**
> + * enum sdca_messageoffset_range - Column definitions UMP MessageOffset
> + */
> +enum sdca_messageoffset_range {
> +	SDCA_MESSAGEOFFSET_BUFFER_START_ADDRESS		= 0,
> +	SDCA_MESSAGEOFFSET_BUFFER_LENGTH		= 1,
> +	SDCA_MESSAGEOFFSET_UMP_MODE			= 2,
> +	SDCA_MESSAGEOFFSET_NCOLS			= 3,
> +};
> +
> +/**
> + * enum sdca_ump_mode - SDCA UMP Mode
> + */
> +enum sdca_ump_mode {
> +	SDCA_UMP_MODE_DIRECT				= 0x00,
> +	SDCA_UMP_MODE_INDIRECT				= 0x01,
> +};
> +
> +/**
> + * enum sdca_ump_owner - SDCA UMP Owner
> + */
> +enum sdca_ump_owner {
> +	SDCA_UMP_OWNER_HOST				= 0x00,
> +	SDCA_UMP_OWNER_DEVICE				= 0x01,
> +};
> +
>  /**
>   * enum sdca_it_controls - SDCA Controls for Input Terminal
>   *
> diff --git a/include/sound/sdca_ump.h b/include/sound/sdca_ump.h
> new file mode 100644
> index 0000000000000..b2363199d19aa
> --- /dev/null
> +++ b/include/sound/sdca_ump.h
> @@ -0,0 +1,45 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * The MIPI SDCA specification is available for public downloads at
> + * https://www.mipi.org/mipi-sdca-v1-0-download
> + *
> + * Copyright (C) 2025 Cirrus Logic, Inc. and
> + *                    Cirrus Logic International Semiconductor Ltd.
> + */
> +
> +#ifndef __SDCA_UMP_H__
> +#define __SDCA_UMP_H__
> +
> +struct regmap;
> +struct sdca_control;
> +struct sdca_entity;
> +struct sdca_function_data;
> +struct snd_soc_component;
> +
> +int sdca_ump_get_owner_host(struct device *dev,
> +			    struct regmap *function_regmap,
> +			    struct sdca_function_data *function,
> +			    struct sdca_entity *entity,
> +			    struct sdca_control *control);
> +int sdca_ump_set_owner_device(struct device *dev,
> +			      struct regmap *function_regmap,
> +			      struct sdca_function_data *function,
> +			      struct sdca_entity *entity,
> +			      struct sdca_control *control);
> +int sdca_ump_read_message(struct device *dev,
> +			  struct regmap *device_regmap,
> +			  struct regmap *function_regmap,
> +			  struct sdca_function_data *function,
> +			  struct sdca_entity *entity,
> +			  unsigned int offset_sel, unsigned int length_sel,
> +			  void **msg);
> +int sdca_ump_write_message(struct device *dev,
> +			   struct regmap *device_regmap,
> +			   struct regmap *function_regmap,
> +			   struct sdca_function_data *function,
> +			   struct sdca_entity *entity,
> +			   unsigned int offset_sel, unsigned int msg_offset,
> +			   unsigned int length_sel,
> +			   void *msg, int msg_len);
> +
> +#endif // __SDCA_UMP_H__
> diff --git a/sound/soc/sdca/Makefile b/sound/soc/sdca/Makefile
> index 5e51760cb6513..a1b24c95cd8c8 100644
> --- a/sound/soc/sdca/Makefile
> +++ b/sound/soc/sdca/Makefile
> @@ -1,6 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  
> -snd-soc-sdca-y := sdca_functions.o sdca_device.o sdca_regmap.o sdca_asoc.o
> +snd-soc-sdca-y := sdca_functions.o sdca_device.o sdca_regmap.o sdca_asoc.o \
> +		  sdca_ump.o
>  snd-soc-sdca-$(CONFIG_SND_SOC_SDCA_HID) += sdca_hid.o
>  snd-soc-sdca-$(CONFIG_SND_SOC_SDCA_IRQ) += sdca_interrupts.o
>  
> diff --git a/sound/soc/sdca/sdca_ump.c b/sound/soc/sdca/sdca_ump.c
> new file mode 100644
> index 0000000000000..5dcad2f7ea05b
> --- /dev/null
> +++ b/sound/soc/sdca/sdca_ump.c
> @@ -0,0 +1,247 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (C) 2025 Cirrus Logic, Inc. and
> +//                    Cirrus Logic International Semiconductor Ltd.
> +
> +/*
> + * The MIPI SDCA specification is available for public downloads at
> + * https://www.mipi.org/mipi-sdca-v1-0-download
> + */
> +
> +#include <linux/dev_printk.h>
> +#include <linux/device.h>
> +#include <linux/regmap.h>
> +#include <sound/sdca.h>
> +#include <sound/sdca_function.h>
> +#include <sound/sdca_ump.h>
> +#include <sound/soc-component.h>
> +#include <linux/soundwire/sdw_registers.h>
> +
> +/**
> + * sdca_ump_get_owner_host - check a UMP buffer is owned by the host
> + * @dev: Pointer to the struct device used for error messages.
> + * @function_regmap: Pointer to the regmap for the SDCA Function.
> + * @function: Pointer to the Function information.
> + * @entity: Pointer to the SDCA Entity.
> + * @control: Pointer to the SDCA Control for the UMP Owner.
> + *
> + * Return: Returns zero on success, and a negative error code on failure.
> + */
> +int sdca_ump_get_owner_host(struct device *dev,
> +			    struct regmap *function_regmap,
> +			    struct sdca_function_data *function,
> +			    struct sdca_entity *entity,
> +			    struct sdca_control *control)
> +{
> +	unsigned int reg, owner;
> +	int ret;
> +
> +	reg = SDW_SDCA_CTL(function->desc->adr, entity->id, control->sel, 0);
> +	ret = regmap_read(function_regmap, reg, &owner);
> +	if (ret < 0) {
> +		dev_err(dev, "%s: failed to read UMP owner: %d\n",
> +			entity->label, ret);
> +		return ret;
> +	}
> +
> +	if (owner != SDCA_UMP_OWNER_HOST) {
> +		dev_err(dev, "%s: host is not the UMP owner\n", entity->label);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_NS_GPL(sdca_ump_get_owner_host, "SND_SOC_SDCA");
> +
> +/**
> + * sdca_ump_set_owner_device - set a UMP buffer's ownership back to the device
> + * @dev: Pointer to the struct device used for error messages.
> + * @function_regmap: Pointer to the regmap for the SDCA Function.
> + * @function: Pointer to the Function information.
> + * @entity: Pointer to the SDCA Entity.
> + * @control: Pointer to the SDCA Control for the UMP Owner.
> + *
> + * Return: Returns zero on success, and a negative error code on failure.
> + */
> +int sdca_ump_set_owner_device(struct device *dev,
> +			      struct regmap *function_regmap,
> +			      struct sdca_function_data *function,
> +			      struct sdca_entity *entity,
> +			      struct sdca_control *control)
> +{
> +	unsigned int reg;
> +	int ret;
> +
> +	reg = SDW_SDCA_CTL(function->desc->adr, entity->id, control->sel, 0);
> +	ret = regmap_write(function_regmap, reg, SDCA_UMP_OWNER_DEVICE);
> +	if (ret < 0)
> +		dev_err(dev, "%s: failed to write UMP owner: %d\n",
> +			entity->label, ret);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_NS_GPL(sdca_ump_set_owner_device, "SND_SOC_SDCA");
> +
> +/**
> + * sdca_ump_read_message - read a UMP message from the device
> + * @dev: Pointer to the struct device used for error messages.
> + * @device_regmap: Pointer to the Device register map.
> + * @function_regmap: Pointer to the regmap for the SDCA Function.
> + * @function: Pointer to the Function information.
> + * @entity: Pointer to the SDCA Entity.
> + * @offset_sel: Control Selector for the UMP Offset Control.
> + * @length_sel: Control Selector for the UMP Length Control.
> + * @msg: Pointer that will be populated with an dynamically buffer
> + * containing the UMP message. Note this needs to be freed by the
> + * caller.
> + *
> + * The caller should first call sdca_ump_get_owner_host() to ensure the host
> + * currently owns the UMP buffer, and then this function can be used to
> + * retrieve a message. It is the callers responsibility to free the
> + * message once it is finished with it. Finally sdca_ump_set_owner_device()
> + * should be called to return the buffer to the device.
> + *
> + * Return: Returns the message length on success, and a negative error
> + * code on failure.
> + */
> +int sdca_ump_read_message(struct device *dev,
> +			  struct regmap *device_regmap,
> +			  struct regmap *function_regmap,
> +			  struct sdca_function_data *function,
> +			  struct sdca_entity *entity,
> +			  unsigned int offset_sel, unsigned int length_sel,
> +			  void **msg)
> +{
> +	struct sdca_control_range *range;
> +	unsigned int msg_offset, msg_len;
> +	unsigned int buf_addr, buf_len;
> +	unsigned int reg;
> +	int ret;
> +
> +	reg = SDW_SDCA_CTL(function->desc->adr, entity->id, offset_sel, 0);
> +	ret = regmap_read(function_regmap, reg, &msg_offset);
> +	if (ret < 0) {
> +		dev_err(dev, "%s: failed to read UMP offset: %d\n",
> +			entity->label, ret);
> +		return ret;
> +	}
> +
> +	range = sdca_selector_find_range(dev, entity, offset_sel,
> +					 SDCA_MESSAGEOFFSET_NCOLS, 1);
> +	if (!range)
> +		return -ENOENT;
> +
> +	buf_addr = sdca_range(range, SDCA_MESSAGEOFFSET_BUFFER_START_ADDRESS, 0);
> +	buf_len = sdca_range(range, SDCA_MESSAGEOFFSET_BUFFER_LENGTH, 0);
> +
> +	reg = SDW_SDCA_CTL(function->desc->adr, entity->id, length_sel, 0);
> +	ret = regmap_read(function_regmap, reg, &msg_len);
> +	if (ret < 0) {
> +		dev_err(dev, "%s: failed to read UMP length: %d\n",
> +			entity->label, ret);
> +		return ret;
> +	}
> +
> +	if (msg_len > buf_len - msg_offset) {
> +		dev_err(dev, "%s: message too big for UMP buffer: %d\n",
> +			entity->label, msg_len);
> +		return -EINVAL;
> +	}
> +
> +	*msg = kmalloc(msg_len, GFP_KERNEL);
> +	if (!*msg)
> +		return -ENOMEM;
> +
> +	ret = regmap_raw_read(device_regmap, buf_addr + msg_offset, *msg, msg_len);
> +	if (ret < 0) {
> +		dev_err(dev, "%s: failed to read UMP message: %d\n",
> +			entity->label, ret);
> +		return ret;
> +	}
> +
> +	return msg_len;
> +}
> +EXPORT_SYMBOL_NS_GPL(sdca_ump_read_message, "SND_SOC_SDCA");
> +
> +/**
> + * sdca_ump_write_message - write a UMP message to the device
> + * @dev: Pointer to the struct device used for error messages.
> + * @device_regmap: Pointer to the Device register map.
> + * @function_regmap: Pointer to the regmap for the SDCA Function.
> + * @function: Pointer to the Function information.
> + * @entity: Pointer to the SDCA Entity.
> + * @offset_sel: Control Selector for the UMP Offset Control.
> + * @msg_offset: Offset within the UMP buffer at which the message should
> + * be written.
> + * @length_sel: Control Selector for the UMP Length Control.
> + * @msg: Pointer to the data that should be written to the UMP buffer.
> + * @msg_len: Length of the message data in bytes.
> + *
> + * The caller should first call sdca_ump_get_owner_host() to ensure the host
> + * currently owns the UMP buffer, and then this function can be used to
> + * write a message. Finally sdca_ump_set_owner_device() should be called to
> + * return the buffer to the device, allowing the device to access the
> + * message.
> + *
> + * Return: Returns zero on success, and a negative error code on failure.
> + */
> +int sdca_ump_write_message(struct device *dev,
> +			   struct regmap *device_regmap,
> +			   struct regmap *function_regmap,
> +			   struct sdca_function_data *function,
> +			   struct sdca_entity *entity,
> +			   unsigned int offset_sel, unsigned int msg_offset,
> +			   unsigned int length_sel,
> +			   void *msg, int msg_len)
> +{
> +	struct sdca_control_range *range;
> +	unsigned int buf_addr, buf_len, ump_mode;
> +	unsigned int reg;
> +	int ret;
> +
> +	range = sdca_selector_find_range(dev, entity, offset_sel,
> +					 SDCA_MESSAGEOFFSET_NCOLS, 1);
> +	if (!range)
> +		return -ENOENT;
> +
> +	buf_addr = sdca_range(range, SDCA_MESSAGEOFFSET_BUFFER_START_ADDRESS, 0);
> +	buf_len = sdca_range(range, SDCA_MESSAGEOFFSET_BUFFER_LENGTH, 0);
> +	ump_mode = sdca_range(range, SDCA_MESSAGEOFFSET_UMP_MODE, 0);
> +
> +	if (msg_len > buf_len - msg_offset) {
> +		dev_err(dev, "%s: message too big for UMP buffer: %d\n",
> +			entity->label, msg_len);
> +		return -EINVAL;
> +	}
> +
> +	if (ump_mode != SDCA_UMP_MODE_DIRECT) {
> +		dev_err(dev, "%s: only direct mode currently supported\n",
> +			entity->label);
> +		return -EINVAL;
> +	}
> +
> +	ret = regmap_raw_write(device_regmap, buf_addr + msg_offset, msg, msg_len);
> +	if (ret) {
> +		dev_err(dev, "%s: failed to write UMP message: %d\n",
> +			entity->label, ret);
> +		return ret;
> +	}
> +
> +	reg = SDW_SDCA_CTL(function->desc->adr, entity->id, offset_sel, 0);
> +	ret = regmap_write(function_regmap, reg, msg_offset);
> +	if (ret < 0) {
> +		dev_err(dev, "%s: failed to write UMP offset: %d\n",
> +			entity->label, ret);
> +		return ret;
> +	}
> +
> +	reg = SDW_SDCA_CTL(function->desc->adr, entity->id, length_sel, 0);
> +	ret = regmap_write(function_regmap, reg, msg_len);
> +	if (ret < 0) {
> +		dev_err(dev, "%s: failed to write UMP length: %d\n",
> +			entity->label, ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_NS_GPL(sdca_ump_write_message, "SND_SOC_SDCA");

