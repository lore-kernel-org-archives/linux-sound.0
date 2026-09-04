Received: from mta0.migadu.com (out-169.mta0.migadu.com [91.218.175.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA5F3F86E6
	for <linux-sound@vger.kernel.org>; Fri,  4 Sep 2026 08:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788510983; cv=none; b=ZY+XS8OyKIdipwz33LfcXwY2QjA+gklj/2F19Vo7ojRRRU0aWwwfxrwmX0f6zXH2Fvwdu2tgp8hqRTzSJz5ft5bTLhNn0CcQTb7W6QQuZZXuGqhFoKAvZksQX+byfBICxjRX+mFleb/4nfhSHvevvjVVdRDJFvXE50ine16K8Eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788510983; c=relaxed/simple;
	bh=8YXf8pl+BqCsCiid2/SiJt+8woe9R+Flgf91q7WhPAk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HqKc4Di5KKN5wls+vD7gWNqT++uioz/EfVpyvKwhwvwgm1F1lQbvTDK5Dr0SZA7zhXavLGaq5hXLRi0eKJ6RzRqofmZpo1jt6HtTbSA6YAq9d26HIuXdijnsrA8fOsCQ6q1XTz9J/tynQIrdWid2AMViPNOr4XzRGjQQNHsgUNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=dH8cBFhH; arc=none smtp.client-ip=91.218.175.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="dH8cBFhH"
X-Envelope-To: linux-sound@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=8YXf8pl+BqCsCiid2/SiJt+8woe9R+Flgf91q7WhPAk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788510978; v=1; x=1789115778;
 b=dH8cBFhHyeqTCOQG0GZ3E5qoqZZHVokyKMZ9up9vkfB4VHONKSAuhHRvDOC2I4pJv/xQEvfu
 mRV3VXRrdEaBAznl6hOqIngthKIkJ9xjEUPQikAfZDqaIef+ayTxMZAzLm2rIjL2gv5LKg4WQq7
 CSbgi6zHv94do7zmge1/Of+0=
X-Envelope-To: linux-sound@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 46559b70c75e47b7;
	Fri, 04 Sep 2026 08:36:18 +0000
X-Mizu-Trace-ID: 46559b70c75e47b7
X-Migadu-Flow: FLOW_OUT
Message-ID: <6aa4b17e-042e-4319-a3a2-41f7346f3755@linux.dev>
Date: Fri, 4 Sep 2026 09:35:15 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soundwire: debugfs: add root-level peripherals table
To: Bard Liao <yung-chuan.liao@linux.intel.com>, linux-sound@vger.kernel.org,
 vkoul@kernel.org
Cc: vinod.koul@linaro.org, linux-kernel@vger.kernel.org,
 peter.ujfalusi@linux.intel.com, bard.liao@intel.com
References: <20260902081802.420946-1-yung-chuan.liao@linux.intel.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20260902081802.420946-1-yung-chuan.liao@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/2/26 10:18, Bard Liao wrote:
> The table will let user know what peripherals are listed and get the
> detected status by the dev_num.

This sounds useful indeed, but does this need to be in debugfs?

We already have a sysfs entry for every peripheral listed in ACPI. Each
peripheral will have a set of properties extracted from DisCo tables,
could we piggy-back on all this and just expose the dev_num?

> 
> Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> ---
>  drivers/soundwire/debugfs.c | 72 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 72 insertions(+)
> 
> diff --git a/drivers/soundwire/debugfs.c b/drivers/soundwire/debugfs.c
> index 2905ec19b838..3cc3428df6a4 100644
> --- a/drivers/soundwire/debugfs.c
> +++ b/drivers/soundwire/debugfs.c
> @@ -9,12 +9,82 @@
>  #include <linux/pm_runtime.h>
>  #include <linux/slab.h>
>  #include <linux/soundwire/sdw.h>
> +#include <linux/soundwire/sdw_type.h>
>  #include <linux/soundwire/sdw_registers.h>
>  #include <linux/string_choices.h>
>  #include "bus.h"
>  
>  static struct dentry *sdw_debugfs_root;
>  
> +#define SDW_PERIPH_HEADER_FMT "%-28s %-7s %-16s %-6s %-7s %-8s %-9s %-11s\n"
> +#define SDW_PERIPH_ENTRY_FMT  "%-28s %-7u %#016llx %-6.4x %-7.4x %-8.2x %-9.2x %-11.1x\n"
> +
> +static u64 sdw_slave_addr_from_id(struct sdw_bus *bus,
> +				 const struct sdw_slave_id *id)
> +{
> +	u64 addr = 0;
> +	u8 unique_id = id->unique_id;
> +
> +	if (unique_id == SDW_IGNORED_UNIQUE_ID)
> +		unique_id = 0;
> +
> +	addr |= FIELD_PREP(SDW_DISCO_LINK_ID_MASK, bus->link_id);
> +	addr |= FIELD_PREP(SDW_VERSION_MASK, id->sdw_version);
> +	addr |= FIELD_PREP(SDW_UNIQUE_ID_MASK, unique_id);
> +	addr |= FIELD_PREP(SDW_MFG_ID_MASK, id->mfg_id);
> +	addr |= FIELD_PREP(SDW_PART_ID_MASK, id->part_id);
> +	addr |= FIELD_PREP(SDW_CLASS_ID_MASK, id->class_id);
> +
> +	return addr;
> +}
> +
> +static void sdw_dump_bus_peripherals(struct seq_file *s_file, struct sdw_bus *bus)
> +{
> +	struct sdw_slave *slave;
> +	u64 addr;
> +
> +	seq_printf(s_file, "master-%d-%d\n",
> +		   bus->controller_id, bus->link_id);
> +	seq_printf(s_file, SDW_PERIPH_HEADER_FMT,
> +		   "name", "dev_num", "addr", "mfg_id", "part_id",
> +		   "class_id", "unique_id", "sdw_version");
> +
> +	mutex_lock(&bus->bus_lock);
> +	list_for_each_entry(slave, &bus->slaves, node) {
> +		addr = sdw_slave_addr_from_id(bus, &slave->id);
> +		seq_printf(s_file, SDW_PERIPH_ENTRY_FMT,
> +			   dev_name(&slave->dev), slave->dev_num,
> +			   addr,
> +			   slave->id.mfg_id, slave->id.part_id,
> +			   slave->id.class_id, slave->id.unique_id,
> +			   slave->id.sdw_version);
> +	}
> +	mutex_unlock(&bus->bus_lock);
> +
> +	seq_putc(s_file, '\n');
> +}
> +
> +static int sdw_root_peripherals_dump(struct device *dev, void *data)
> +{
> +	struct sdw_master_device *md;
> +	struct seq_file *s_file = data;
> +
> +	if (dev->type != &sdw_master_type)
> +		return 0;
> +
> +	md = dev_to_sdw_master_device(dev);
> +	sdw_dump_bus_peripherals(s_file, md->bus);
> +
> +	return 0;
> +}
> +
> +static int sdw_root_peripherals_show(struct seq_file *s_file, void *data)
> +{
> +	return bus_for_each_dev(&sdw_bus_type, NULL, s_file,
> +				sdw_root_peripherals_dump);
> +}
> +DEFINE_SHOW_ATTRIBUTE(sdw_root_peripherals);
> +
>  void sdw_bus_debugfs_init(struct sdw_bus *bus)
>  {
>  	char name[16];
> @@ -375,6 +445,8 @@ void sdw_debugfs_init(void)
>  		firmware_file = kstrdup("", GFP_KERNEL);
>  
>  	sdw_debugfs_root = debugfs_create_dir("soundwire", NULL);
> +	debugfs_create_file("peripherals", 0400, sdw_debugfs_root, NULL,
> +			    &sdw_root_peripherals_fops);
>  }
>  
>  void sdw_debugfs_exit(void)

