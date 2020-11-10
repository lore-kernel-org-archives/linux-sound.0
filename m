From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 10 Nov 2020 08:48:26 +0000
Subject: Re: [PATCH v2] drivers: most: add ALSA sound driver
Message-Id: <20201110084826.GE29398@kadam>
List-Id: <linux-sound.vger.kernel.org>
References: <1604680254-17185-1-git-send-email-christian.gromm@microchip.com>
In-Reply-To: <1604680254-17185-1-git-send-email-christian.gromm@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christian Gromm <christian.gromm@microchip.com>
Cc: gregkh@linuxfoundation.org, driverdev-devel@linuxdriverproject.org, linux-sound@vger.kernel.org

On Fri, Nov 06, 2020 at 05:30:54PM +0100, Christian Gromm wrote:
> +static struct list_head adpt_list;
> +
> +#define MOST_PCM_INFO (SNDRV_PCM_INFO_MMAP | \
> +		       SNDRV_PCM_INFO_MMAP_VALID | \
> +		       SNDRV_PCM_INFO_BATCH | \
> +		       SNDRV_PCM_INFO_INTERLEAVED | \
> +		       SNDRV_PCM_INFO_BLOCK_TRANSFER)
> +
> +static void swap_copy16(u16 *dest, const u16 *source, unsigned int bytes)
> +{
> +	unsigned int i = 0;
> +
> +	while (i < (bytes / 2)) {
> +		dest[i] = swab16(source[i]);
> +		i++;
> +	}
> +}
> +
> +static void swap_copy24(u8 *dest, const u8 *source, unsigned int bytes)
> +{
> +	unsigned int i = 0;
> +
> +	while (i < bytes - 2) {

Can bytes ever be zero?  If so then this will corrupt memory and crash.

Generally "int i;" is less risky than "unsigned int i;".  Of course, I
recently almost introduced a situation where we were copying up to
ULONG_MAX bytes so there are times when iterators should be size_t so
that does happen.  It could be buggy either way is what I'm saying but
generally "unsigned int i;" is more often buggy.

> +		dest[i] = source[i + 2];
> +		dest[i + 1] = source[i + 1];
> +		dest[i + 2] = source[i];
> +		i += 3;
> +	}
> +}
> +
> +static void swap_copy32(u32 *dest, const u32 *source, unsigned int bytes)
> +{
> +	unsigned int i = 0;
> +
> +	while (i < bytes / 4) {
> +		dest[i] = swab32(source[i]);
> +		i++;
> +	}
> +}
> +
> +static void alsa_to_most_memcpy(void *alsa, void *most, unsigned int bytes)
> +{
> +	memcpy(most, alsa, bytes);
> +}
> +
> +static void alsa_to_most_copy16(void *alsa, void *most, unsigned int bytes)
> +{
> +	swap_copy16(most, alsa, bytes);
> +}
> +
> +static void alsa_to_most_copy24(void *alsa, void *most, unsigned int bytes)
> +{
> +	swap_copy24(most, alsa, bytes);
> +}
> +
> +static void alsa_to_most_copy32(void *alsa, void *most, unsigned int bytes)
> +{
> +	swap_copy32(most, alsa, bytes);
> +}
> +
> +static void most_to_alsa_memcpy(void *alsa, void *most, unsigned int bytes)
> +{
> +	memcpy(alsa, most, bytes);
> +}
> +
> +static void most_to_alsa_copy16(void *alsa, void *most, unsigned int bytes)
> +{
> +	swap_copy16(alsa, most, bytes);
> +}
> +
> +static void most_to_alsa_copy24(void *alsa, void *most, unsigned int bytes)
> +{
> +	swap_copy24(alsa, most, bytes);
> +}
> +
> +static void most_to_alsa_copy32(void *alsa, void *most, unsigned int bytes)
> +{
> +	swap_copy32(alsa, most, bytes);
> +}
> +
> +/**
> + * get_channel - get pointer to channel
> + * @iface: interface structure
> + * @channel_id: channel ID
> + *
> + * This traverses the channel list and returns the channel matching the
> + * ID and interface.
> + *
> + * Returns pointer to channel on success or NULL otherwise.
> + */
> +static struct channel *get_channel(struct most_interface *iface,
> +				   int channel_id)
> +{
> +	struct sound_adapter *adpt = iface->priv;
> +	struct channel *channel, *tmp;
> +
> +	list_for_each_entry_safe(channel, tmp, &adpt->dev_list, list) {
> +		if ((channel->iface = iface) && (channel->id = channel_id))
> +			return channel;

No need to use the _safe() version of this loop macro.  You're not
freeing anything.  My concern is that sometimes people think the _safe()
has something to do with locking and it does not.

> +	}
> +	return NULL;
> +}
> +

[ Snip ]

> +/**
> + * audio_probe_channel - probe function of the driver module
> + * @iface: pointer to interface instance
> + * @channel_id: channel index/ID
> + * @cfg: pointer to actual channel configuration
> + * @arg_list: string that provides the name of the device to be created in /dev
> + *	      plus the desired audio resolution
> + *
> + * Creates sound card, pcm device, sets pcm ops and registers sound card.
> + *
> + * Returns 0 on success or error code otherwise.
> + */
> +static int audio_probe_channel(struct most_interface *iface, int channel_id,
> +			       struct most_channel_config *cfg,
> +			       char *device_name, char *arg_list)
> +{
> +	struct channel *channel;
> +	struct sound_adapter *adpt;
> +	struct snd_pcm *pcm;
> +	int playback_count = 0;
> +	int capture_count = 0;
> +	int ret;
> +	int direction;
> +	u16 ch_num;
> +	char *sample_res;
> +	char arg_list_cpy[STRING_SIZE];
> +
> +	if (cfg->data_type != MOST_CH_SYNC) {
> +		pr_err("Incompatible channel type\n");
> +		return -EINVAL;
> +	}
> +	strlcpy(arg_list_cpy, arg_list, STRING_SIZE);
> +	ret = split_arg_list(arg_list_cpy, &ch_num, &sample_res);
> +	if (ret < 0)
> +		return ret;
> +
> +	list_for_each_entry(adpt, &adpt_list, list) {
> +		if (adpt->iface != iface)
> +			continue;
> +		if (adpt->registered)
> +			return -ENOSPC;
> +		adpt->pcm_dev_idx++;
> +		goto skip_adpt_alloc;

It's weird how if the "channel = " allocation fails, then we free this
"adpt" which we didn't allocate.

> +	}
> +	adpt = kzalloc(sizeof(*adpt), GFP_KERNEL);
> +	if (!adpt)
> +		return -ENOMEM;
> +
> +	adpt->iface = iface;
> +	INIT_LIST_HEAD(&adpt->dev_list);
> +	iface->priv = adpt;
> +	list_add_tail(&adpt->list, &adpt_list);
> +	ret = snd_card_new(iface->driver_dev, -1, "INIC", THIS_MODULE,
> +			   sizeof(*channel), &adpt->card);
> +	if (ret < 0)
> +		goto err_free_adpt;
> +	snprintf(adpt->card->driver, sizeof(adpt->card->driver),
> +		 "%s", DRIVER_NAME);
> +	snprintf(adpt->card->shortname, sizeof(adpt->card->shortname),
> +		 "Microchip INIC");
> +	snprintf(adpt->card->longname, sizeof(adpt->card->longname),
> +		 "%s at %s", adpt->card->shortname, iface->description);
> +skip_adpt_alloc:
> +	if (get_channel(iface, channel_id)) {
> +		pr_err("channel (%s:%d) is already linked\n",
> +		       iface->description, channel_id);
> +		return -EEXIST;
> +	}
> +
> +	if (cfg->direction = MOST_CH_TX) {
> +		playback_count = 1;
> +		direction = SNDRV_PCM_STREAM_PLAYBACK;
> +	} else {
> +		capture_count = 1;
> +		direction = SNDRV_PCM_STREAM_CAPTURE;
> +	}
> +	channel = kzalloc(sizeof(*channel), GFP_KERNEL);
> +	if (!channel) {
> +		ret = -ENOMEM;
> +		goto err_free_adpt;
> +	}
> +	channel->card = adpt->card;
> +	channel->cfg = cfg;
> +	channel->iface = iface;
> +	channel->id = channel_id;
> +	init_waitqueue_head(&channel->playback_waitq);
> +	list_add_tail(&channel->list, &adpt->dev_list);
> +
> +	ret = audio_set_hw_params(&channel->pcm_hardware, ch_num, sample_res,
> +				  cfg);
> +	if (ret)
> +		goto err_free_adpt;
> +
> +	ret = snd_pcm_new(adpt->card, device_name, adpt->pcm_dev_idx,
> +			  playback_count, capture_count, &pcm);

I don't see any snd_pcm_free() to match this snd_pcm_new().

> +
> +	if (ret < 0)
> +		goto err_free_adpt;
> +
> +	pcm->private_data = channel;
> +	strscpy(pcm->name, device_name, sizeof(pcm->name));
> +	snd_pcm_set_ops(pcm, direction, &pcm_ops);
> +	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_VMALLOC, NULL, 0, 0);
> +	return 0;
> +
> +err_free_adpt:
> +	release_adapter(adpt);
> +	return ret;
> +}

regards,
dan carpenter
